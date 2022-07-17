import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  const TextDisplay({required this.message, Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
