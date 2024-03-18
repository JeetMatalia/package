import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).myAppColors;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,

      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colors.blue18)),
    );
  }
}
