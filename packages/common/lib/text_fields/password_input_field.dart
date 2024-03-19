
import 'package:common/common.dart';
import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordInputField extends StatefulWidget {
  final bool? enabled;
  final TextEditingController controller;
  final Function(String?) validation;
  final Function(String?)? onChange;
  final double? fontSize;
  final String label;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;

  const PasswordInputField({
    Key? key,
    required this.controller,
    this.onChange,
    required this.validation,
    required this.hintText,
    this.enabled,
    required this.label,
    this.fontSize,
    this.contentPadding,
    this.height,
    this.inputFormatters,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    // Define color and border as needed based on your theme
    // For demonstration, I'm using some default values.
    final color = Theme.of(context).myAppColors;
    // Border
    final border = _outlineBorder(
      color.darkBlue25.withOpacity(0.28),
    );

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: color.greyC2,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          SizedBox(
            height: widget.height,
            child: TextFormField(
              enabled: widget.enabled ?? true,
              onChanged: widget.onChange,
              controller: widget.controller,
              obscureText: isObscured,
              validator: (value) => widget.validation(value),
              inputFormatters: widget.inputFormatters,
              obscuringCharacter: '●',
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                color: Colors.black,
                fontSize: widget.fontSize ?? 18,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                errorMaxLines: 3,
                suffixIcon: Padding(
                  padding:  EdgeInsets.only(right: 4),

                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: color.greyB6,
                ),
                enabledBorder: border,
                border: border,
                focusedErrorBorder: border,
                focusedBorder: border,
                errorBorder: border,
                disabledBorder: border,
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: color),
    );
  }
}
