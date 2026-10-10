import 'package:kana_master/constants.dart';

/// A selectable group of kana for practice (a row like あいうえお, a dakuten
/// row like がぎぐげご, or the contracted sounds like きゃ).
class KanaGroup {
  final String id;
  final String label;
  final List<String> symbols;
  final KanaGroupKind kind;

  const KanaGroup({
    required this.id,
    required this.label,
    required this.symbols,
    required this.kind,
  });
}

enum KanaGroupKind { basic, dakuten, combo }

/// Katakana with dakuten/handakuten. Not recognised by the drawing model and
/// without stroke data, so they're only used in quiz modes.
const Map<String, String> katakanaDakuten = {
  "ガ": "ga", "ギ": "gi", "グ": "gu", "ゲ": "ge", "ゴ": "go",
  "ザ": "za", "ジ": "ji", "ズ": "zu", "ゼ": "ze", "ゾ": "zo",
  "ダ": "da", "ヂ": "ji", "ヅ": "zu", "デ": "de", "ド": "do",
  "バ": "ba", "ビ": "bi", "ブ": "bu", "ベ": "be", "ボ": "bo",
  "パ": "pa", "ピ": "pi", "プ": "pu", "ペ": "pe", "ポ": "po",
};

/// Contracted sounds (yōon) in hiragana. Quiz modes only.
const Map<String, String> hiraganaCombos = {
  "きゃ": "kya", "きゅ": "kyu", "きょ": "kyo",
  "しゃ": "sha", "しゅ": "shu", "しょ": "sho",
  "ちゃ": "cha", "ちゅ": "chu", "ちょ": "cho",
  "にゃ": "nya", "にゅ": "nyu", "にょ": "nyo",
  "ひゃ": "hya", "ひゅ": "hyu", "ひょ": "hyo",
  "みゃ": "mya", "みゅ": "myu", "みょ": "myo",
  "りゃ": "rya", "りゅ": "ryu", "りょ": "ryo",
  "ぎゃ": "gya", "ぎゅ": "gyu", "ぎょ": "gyo",
  "じゃ": "ja", "じゅ": "ju", "じょ": "jo",
  "びゃ": "bya", "びゅ": "byu", "びょ": "byo",
  "ぴゃ": "pya", "ぴゅ": "pyu", "ぴょ": "pyo",
};

/// Contracted sounds (yōon) in katakana. Quiz modes only.
const Map<String, String> katakanaCombos = {
  "キャ": "kya", "キュ": "kyu", "キョ": "kyo",
  "シャ": "sha", "シュ": "shu", "ショ": "sho",
  "チャ": "cha", "チュ": "chu", "チョ": "cho",
  "ニャ": "nya", "ニュ": "nyu", "ニョ": "nyo",
  "ヒャ": "hya", "ヒュ": "hyu", "ヒョ": "hyo",
  "ミャ": "mya", "ミュ": "myu", "ミョ": "myo",
  "リャ": "rya", "リュ": "ryu", "リョ": "ryo",
  "ギャ": "gya", "ギュ": "gyu", "ギョ": "gyo",
  "ジャ": "ja", "ジュ": "ju", "ジョ": "jo",
  "ビャ": "bya", "ビュ": "byu", "ビョ": "byo",
  "ピャ": "pya", "ピュ": "pyu", "ピョ": "pyo",
};

List<KanaGroup> _buildGroups({
  required String prefix,
  required List<List<String>> basicRows,
  required List<List<String>> dakutenRows,
  required List<String> combos,
}) {
  return [
    for (final row in basicRows)
      KanaGroup(
        id: '$prefix-${row.first}',
        label: row.first,
        symbols: row,
        kind: KanaGroupKind.basic,
      ),
    for (final row in dakutenRows)
      KanaGroup(
        id: '$prefix-${row.first}',
        label: row.first,
        symbols: row,
        kind: KanaGroupKind.dakuten,
      ),
    KanaGroup(
      id: '$prefix-combo',
      label: '${combos.first}…',
      symbols: combos,
      kind: KanaGroupKind.combo,
    ),
  ];
}

final List<KanaGroup> hiraganaGroups = _buildGroups(
  prefix: 'h',
  basicRows: const [
    ['あ', 'い', 'う', 'え', 'お'],
    ['か', 'き', 'く', 'け', 'こ'],
    ['さ', 'し', 'す', 'せ', 'そ'],
    ['た', 'ち', 'つ', 'て', 'と'],
    ['な', 'に', 'ぬ', 'ね', 'の'],
    ['は', 'ひ', 'ふ', 'へ', 'ほ'],
    ['ま', 'み', 'む', 'め', 'も'],
    ['や', 'ゆ', 'よ'],
    ['ら', 'り', 'る', 'れ', 'ろ'],
    ['わ', 'を', 'ん'],
  ],
  dakutenRows: const [
    ['が', 'ぎ', 'ぐ', 'げ', 'ご'],
    ['ざ', 'じ', 'ず', 'ぜ', 'ぞ'],
    ['だ', 'ぢ', 'づ', 'で', 'ど'],
    ['ば', 'び', 'ぶ', 'べ', 'ぼ'],
    ['ぱ', 'ぴ', 'ぷ', 'ぺ', 'ぽ'],
  ],
  combos: hiraganaCombos.keys.toList(),
);

final List<KanaGroup> katakanaGroups = _buildGroups(
  prefix: 'k',
  basicRows: const [
    ['ア', 'イ', 'ウ', 'エ', 'オ'],
    ['カ', 'キ', 'ク', 'ケ', 'コ'],
    ['サ', 'シ', 'ス', 'セ', 'ソ'],
    ['タ', 'チ', 'ツ', 'テ', 'ト'],
    ['ナ', 'ニ', 'ヌ', 'ネ', 'ノ'],
    ['ハ', 'ヒ', 'フ', 'ヘ', 'ホ'],
    ['マ', 'ミ', 'ム', 'メ', 'モ'],
    ['ヤ', 'ユ', 'ヨ'],
    ['ラ', 'リ', 'ル', 'レ', 'ロ'],
    ['ワ', 'ヲ', 'ン'],
  ],
  dakutenRows: const [
    ['ガ', 'ギ', 'グ', 'ゲ', 'ゴ'],
    ['ザ', 'ジ', 'ズ', 'ゼ', 'ゾ'],
    ['ダ', 'ヂ', 'ヅ', 'デ', 'ド'],
    ['バ', 'ビ', 'ブ', 'ベ', 'ボ'],
    ['パ', 'ピ', 'プ', 'ペ', 'ポ'],
  ],
  combos: katakanaCombos.keys.toList(),
);

List<KanaGroup> kanaGroupsFor(KanaType type) =>
    type == KanaType.katakana ? katakanaGroups : hiraganaGroups;

/// Groups selected when the user hasn't chosen any: every basic and dakuten
/// row, which matches what the practice used before groups existed.
Set<String> defaultKanaGroupIds(KanaType type) => kanaGroupsFor(type)
    .where((g) => g.kind != KanaGroupKind.combo)
    .map((g) => g.id)
    .toSet();

/// Romaji for any kana symbol the app knows (basic, dakuten and combos).
String? romajiForKana(String symbol) =>
    hiragana[symbol] ??
    katakana[symbol] ??
    katakanaDakuten[symbol] ??
    hiraganaCombos[symbol] ??
    katakanaCombos[symbol];
