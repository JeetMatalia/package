import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? verticalTextPadding;
  final void Function() onTap;
  final Color? borderColor;
  final double? fontSize;
  final Color? textColor;
  final double? borderRadius;
  final double? buttonHeight;
  final Widget? icon;
  final bool? isDisable;
  final FontWeight? fontWeight;
  final List<BoxShadow>? boxShadow;

  const PrimaryButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.verticalTextPadding,
      required this.onTap,
      this.borderColor,
      this.fontSize,
      this.textColor,
      this.borderRadius,
      this.buttonHeight,
      this.icon,
      this.isDisable,
      this.fontWeight,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).myAppColors;
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        buttonText,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.blue18)),
    );
  }
}
