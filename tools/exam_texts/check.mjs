// Checks that the item texts of a language match the Spanish ones: same
// items, same fields, same number of sub-questions and no empty strings.
//
//   node tools/exam_texts/check.mjs <language> [<language>…]
import fs from 'fs';

const mondai = ['kanjiReading', 'orthography', 'contextual', 'paraphrase', 'grammarForm', 'sentenceOrder',
  'textGrammar', 'shortReading', 'midReading', 'infoSearch', 'taskListening', 'pointListening', 'utterance', 'quickResponse'];

function shape(entry) {
  return Object.keys(entry).sort().map((k) =>
    Array.isArray(entry[k]) ? `${k}[${entry[k].map((s) => Object.keys(s).sort().join('+')).join(',')}]` : k).join(' ');
}

let problems = 0;
const fail = (msg) => { problems++; if (problems <= 50) console.log(msg); };

for (const lang of process.argv.slice(2)) {
  for (const m of mondai) {
    const ref = JSON.parse(fs.readFileSync(`assets/exam/i18n/es/${m}.json`, 'utf8'));
    const file = `assets/exam/i18n/${lang}/${m}.json`;
    if (!fs.existsSync(file)) { fail(`${file}: missing`); continue; }
    let texts;
    try { texts = JSON.parse(fs.readFileSync(file, 'utf8')); } catch (e) { fail(`${file}: ${e.message}`); continue; }
    for (const id of Object.keys(texts)) if (!(id in ref)) fail(`${file}: unknown id ${id}`);
    for (const [id, entry] of Object.entries(ref)) {
      const got = texts[id];
      if (!got) { fail(`${file}: missing ${id}`); continue; }
      if (shape(got) !== shape(entry)) { fail(`${file}: ${id} has ${shape(got)}, expected ${shape(entry)}`); continue; }
      const strings = [got.e, got.t, got.tt, ...['qs', 'blanks'].flatMap((k) => (got[k] ?? []).flatMap((s) => [s.e, s.t]))];
      for (const s of strings) {
        if (s === undefined) continue;
        if (typeof s !== 'string' || !s.trim()) fail(`${file}: ${id} has an empty text`);
      }
      // Listening transcripts keep one line per line of the Spanish one.
      if (entry.t && got.t && entry.t.split('\n').length !== got.t.split('\n').length) {
        fail(`${file}: ${id} has ${got.t.split('\n').length} lines in t, expected ${entry.t.split('\n').length}`);
      }
    }
  }
}
if (problems) { console.log(`${problems} problems`); process.exit(1); }
console.log('ok');
