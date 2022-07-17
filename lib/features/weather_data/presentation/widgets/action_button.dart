import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({required this.text, required this.onPress, Key? key}) : super(key: key);

  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPress(),
      child: Text(text),
    );
  }
}
