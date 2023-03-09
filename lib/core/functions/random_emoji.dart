import 'dart:math';

const _emojis = [
  "😀",
  "😁",
  "😃",
  "😄",
  "😅",
  "😆",
  "😇",
  "😉",
  "😊",
  "😍",
  "😗",
  "😘",
  "😙",
  "😚",
  "😛",
  "😜",
  "😝",
  "✌",
];

String randomEmoji() {
  final result = (Random().nextDouble() * ((_emojis.length - 1))).floor();
  return _emojis[result];
}
