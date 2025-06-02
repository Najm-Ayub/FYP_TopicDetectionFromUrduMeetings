import 'package:flutter/material.dart';

Widget highlightText(String text, String shortString) {
  final shortWords = shortString.split(" ");
  final longWords = text.split(" ");

  List<TextSpan> children = [];
  // ignore: unused_local_variable
  int wordIndex = 0;

  for (String word in longWords) {
    bool isHighlighted = false;
    for (String shortWord in shortWords) {
      if (word.toLowerCase() == shortWord.toLowerCase()) {
        isHighlighted = true;
        break;
      }
    }
    children.add(
      TextSpan(
        text: "$word ",
        style: TextStyle(
          color: isHighlighted ? Colors.red : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    wordIndex++;
  }

  return RichText(
    text: TextSpan(children: children),
  );
}
