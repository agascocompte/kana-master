import 'package:flutter/material.dart';

const Color jOrange = Color(0xFFFFB61E);
const Color jLightBLue = Color(0xFF4D8FAC);
const Color jDarkBLue = Color(0xFF003171);

const int imageDimensions = 128;
const int totalClasses = 45;

enum KanaType { hiragana, katakana }

enum TestType {
  drawingTest,
  singleChoiceTest,
}

const Map<String, String> hiragana = {
  "あ": "a",
  "い": "i",
  "う": "u",
  "え": "e",
  "お": "o",
  "か": "ka",
  "き": "ki",
  "く": "ku",
  "け": "ke",
  "こ": "ko",
  "さ": "sa",
  "し": "shi",
  "す": "su",
  "せ": "se",
  "そ": "so",
  "た": "ta",
  "ち": "chi",
  "つ": "tsu",
  "て": "te",
  "と": "to",
  "な": "na",
  "に": "ni",
  "ぬ": "nu",
  "ね": "ne",
  "の": "no",
  "は": "ha",
  "ひ": "hi",
  "ふ": "fu",
  "へ": "he",
  "ほ": "ho",
  "ま": "ma",
  "み": "mi",
  "む": "mu",
  "め": "me",
  "も": "mo",
  "や": "ya",
  "ゆ": "yu",
  "よ": "yo",
  "ら": "ra",
  "り": "ri",
  "る": "ru",
  "れ": "re",
  "ろ": "ro",
  "わ": "wa",
  "を": "wo",
  "ん": "n",
};

const Map<String, String> hiraganaWithoutWo = {
  "あ": "a",
  "い": "i",
  "う": "u",
  "え": "e",
  "お": "o",
  "か": "ka",
  "き": "ki",
  "く": "ku",
  "け": "ke",
  "こ": "ko",
  "さ": "sa",
  "し": "shi",
  "す": "su",
  "せ": "se",
  "そ": "so",
  "た": "ta",
  "ち": "chi",
  "つ": "tsu",
  "て": "te",
  "と": "to",
  "な": "na",
  "に": "ni",
  "ぬ": "nu",
  "ね": "ne",
  "の": "no",
  "は": "ha",
  "ひ": "hi",
  "ふ": "fu",
  "へ": "he",
  "ほ": "ho",
  "ま": "ma",
  "み": "mi",
  "む": "mu",
  "め": "me",
  "も": "mo",
  "や": "ya",
  "ゆ": "yu",
  "よ": "yo",
  "ら": "ra",
  "り": "ri",
  "る": "ru",
  "れ": "re",
  "ろ": "ro",
  "わ": "wa",
  "ん": "n",
};

const Map<String, String> katakana = {
  "ア": "a",
  "イ": "i",
  "ウ": "u",
  "エ": "e",
  "オ": "o",
  "カ": "ka",
  "キ": "ki",
  "ク": "ku",
  "ケ": "ke",
  "コ": "ko",
  "サ": "sa",
  "シ": "shi",
  "ス": "su",
  "セ": "se",
  "ソ": "so",
  "タ": "ta",
  "チ": "chi",
  "ツ": "tsu",
  "テ": "te",
  "ト": "to",
  "ナ": "na",
  "ニ": "ni",
  "ヌ": "nu",
  "ネ": "ne",
  "ノ": "no",
  "ハ": "ha",
  "ヒ": "hi",
  "フ": "fu",
  "ヘ": "he",
  "ホ": "ho",
  "マ": "ma",
  "ミ": "mi",
  "ム": "mu",
  "メ": "me",
  "モ": "mo",
  "ヤ": "ya",
  "ユ": "yu",
  "ヨ": "yo",
  "ラ": "ra",
  "リ": "ri",
  "ル": "ru",
  "レ": "re",
  "ロ": "ro",
  "ワ": "wa",
  "ヲ": "wo",
  "ン": "n",
};
