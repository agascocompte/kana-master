// Builds the N5 listening recordings from assets/exam/bank/*.json.
//
//   cd tools/exam_audio && npm install && node generate.mjs [--force] [ids…]
//
// Each item becomes assets/exam/audio/<id>.mp3, said in the order of
// listeningScript() in lib/domain/exam/exam_bank.dart. The item number
// ("１ばん") and the instructions of each もんだい are separate clips, since
// the number depends on where the item lands in a test.
//
// Voices come from Microsoft Edge's read-aloud service, which has one woman
// (Nanami) and one man (Keita) for Japanese; pitch tells the narrator and a
// second speaker of the same sex apart.

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { MsEdgeTTS, OUTPUT_FORMAT } from 'msedge-tts';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const bankDir = path.join(root, 'assets/exam/bank');
const outDir = path.join(root, 'assets/exam/audio');

const args = process.argv.slice(2);
const force = args.includes('--force');
const only = new Set(args.filter((a) => !a.startsWith('--')));

// N5 recordings are slower than natural speech.
const VOICES = {
  N: { voice: 'ja-JP-NanamiNeural', rate: '-12%', pitch: '-6%' },
  F: { voice: 'ja-JP-NanamiNeural', rate: '-8%', pitch: '+2%' },
  F2: { voice: 'ja-JP-NanamiNeural', rate: '-8%', pitch: '+12%' },
  M: { voice: 'ja-JP-KeitaNeural', rate: '-8%', pitch: '+0%' },
  M2: { voice: 'ja-JP-KeitaNeural', rate: '-8%', pitch: '-10%' },
};

const INSTRUCTIONS = {
  taskListening:
    'もんだい１では、はじめに しつもんを きいて ください。それから はなしを きいて、もんだいようしの １から４の なかから、いちばん いい ものを ひとつ えらんで ください。',
  pointListening:
    'もんだい２では、はじめに しつもんを きいて ください。それから はなしを きいて、もんだいようしの １から４の なかから、いちばん いい ものを ひとつ えらんで ください。',
  utterance:
    'もんだい３では、えを みながら しつもんを きいて ください。やじるしの ひとは なんと いいますか。１から３の なかから、いちばん いい ものを ひとつ えらんで ください。',
  quickResponse:
    'もんだい４は、えなどが ありません。ぶんを きいて、１から３の なかから、いちばん いい ものを ひとつ えらんで ください。',
};

const NUMBERS = ['いち', 'に', 'さん', 'よん', 'ご', 'ろく', 'なな'];

const escape = (text) =>
  text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

/** One stretch of speech followed by silence. */
const say = (speaker, text, pauseMs = 600) => ({ speaker, text, pauseMs });

/** Segments of one item, matching listeningScript() in the app. */
function segments(mondai, item) {
  switch (mondai) {
    case 'taskListening':
    case 'pointListening':
      return [
        say('N', item.intro, 500),
        // Time to look at the printed choices before the talk starts.
        say('N', item.q, mondai === 'pointListening' ? 4000 : 2000),
        ...item.lines.map(([speaker, text]) => say(speaker, text, 500)),
        say('N', item.q, 300),
      ];
    case 'utterance':
      return [
        say('N', item.situation, 1200),
        ...item.o.map((text, i) => say(item.say, `${i + 1}、${text}`, 900)),
      ];
    case 'quickResponse':
      return [
        say(item.line[0], item.line[1], 1200),
        ...item.o.map((text, i) => say(item.resp, `${i + 1}、${text}`, 900)),
      ];
    default:
      throw new Error(`${mondai} is not a listening type`);
  }
}

const clients = new Map();

async function client(voice) {
  if (!clients.has(voice)) {
    const tts = new MsEdgeTTS();
    await tts.setMetadata(voice, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
    clients.set(voice, tts);
  }
  return clients.get(voice);
}

// The service ignores SSML breaks (it drops the connection), so pauses are
// silent frames in its own format: MPEG-2 layer III, 24 kHz mono, 48 kbps,
// 144 bytes and 24 ms per frame. A frame with empty side info decodes to
// silence.
const FRAME_HEADER = Buffer.from('fff364c4', 'hex');
const FRAME_BYTES = 144;
const FRAME_MS = 24;

function silence(ms) {
  const frame = Buffer.concat([FRAME_HEADER, Buffer.alloc(FRAME_BYTES - 4)]);
  return Buffer.concat(Array(Math.ceil(ms / FRAME_MS)).fill(frame));
}

async function synthesize({ speaker, text, pauseMs }) {
  const v = VOICES[speaker];
  if (!v) throw new Error(`unknown speaker ${speaker}`);
  for (let attempt = 1; ; attempt++) {
    try {
      const tts = await client(v.voice);
      const { audioStream } = tts.toStream(escape(text), { rate: v.rate, pitch: v.pitch });
      const chunks = [];
      for await (const chunk of audioStream) chunks.push(chunk);
      const audio = Buffer.concat(chunks);
      if (audio.length === 0) throw new Error('empty audio');
      if (!audio.subarray(0, 4).equals(FRAME_HEADER)) {
        throw new Error(`unexpected MP3 format ${audio.subarray(0, 4).toString('hex')}`);
      }
      return Buffer.concat([audio, silence(pauseMs)]);
    } catch (e) {
      clients.get(v.voice)?.close();
      clients.delete(v.voice);
      if (attempt >= 4) throw e;
      await new Promise((r) => setTimeout(r, 1500 * attempt));
    }
  }
}

async function write(name, segs) {
  const file = path.join(outDir, `${name}.mp3`);
  if (!force && fs.existsSync(file)) return false;
  const parts = [];
  for (const seg of segs) parts.push(await synthesize(seg));
  // MP3 frames of the same format play back to back when concatenated.
  fs.writeFileSync(file, Buffer.concat(parts));
  return true;
}

async function main() {
  fs.mkdirSync(outDir, { recursive: true });
  const jobs = [];
  for (const [mondai, text] of Object.entries(INSTRUCTIONS)) {
    jobs.push([`inst_${mondai}`, [say('N', text, 800)]]);
  }
  NUMBERS.forEach((n, i) => jobs.push([`num_${i + 1}`, [say('N', `${n}ばん。`, 700)]]));
  for (const mondai of Object.keys(INSTRUCTIONS)) {
    const items = JSON.parse(fs.readFileSync(path.join(bankDir, `${mondai}.json`), 'utf8'));
    for (const item of items) jobs.push([item.id, segments(mondai, item)]);
  }

  let made = 0;
  for (const [name, segs] of jobs) {
    if (only.size && !only.has(name)) continue;
    if (await write(name, segs)) {
      made++;
      process.stdout.write(`${name} `);
    }
  }
  for (const tts of clients.values()) tts.close();
  console.log(`\n${made} recordings written to ${path.relative(root, outDir)}`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
