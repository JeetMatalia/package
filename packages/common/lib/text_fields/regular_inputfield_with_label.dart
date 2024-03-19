import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegularInputFieldWithLabel extends StatelessWidget {
  final bool? enabled;
  final TextEditingController controller;
  final Function(String?) validation;
  final Function(String?)? onChange;
  final FormFieldSetter<String>? onSaved;
  final double? fontSize;
  final String? label;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final bool? isNumberKeyboard;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? isGradeIcon;
  final bool? isDynamicItem;
  final double? height;
  final BoxConstraints? suffixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  const RegularInputFieldWithLabel({
    super.key,
    required this.controller,
    this.onChange,
    required this.validation,
    required this.hintText,
    this.enabled,
    required this.label,
    this.fontSize,
    this.contentPadding,
    this.maxLines,
    this.height,
    this.isNumberKeyboard,
    this.suffixIcon,
    this.maxLength,
    this.isGradeIcon,
    this.suffixIconConstraints,
    this.inputFormatters,
    this.isDynamicItem,
    this.onSaved,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).myAppColors;

    /// KeyboardType
    ///
    final keyBoardType =
        (maxLines ?? 1) > 1 ? TextInputType.multiline : TextInputType.text;

    // Border
    final border = _outlineBorder(
      color.darkBlue25.withOpacity(0.28),
    );

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: TextStyle(
              color: color.greyC2,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: height,
            child: TextFormField(
              enabled: enabled ?? true,
              onChanged: onChange,
              onSaved: onSaved,
              maxLength: maxLength,
              controller: controller,
              textInputAction: textInputAction ?? ((maxLines ?? 1) > 1
                      ? TextInputAction.newline
                      : TextInputAction.next),
              validator: (value) => validation(value),
              inputFormatters: inputFormatters,
              keyboardType: isNumberKeyboard == true
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : keyBoardType,
              maxLines: maxLines ?? 1,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                color: color.black,
                fontSize: fontSize ?? 14,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                errorMaxLines: 3,
                suffixIconConstraints: suffixIconConstraints,
                suffixIcon: Padding(
                  padding:
                      EdgeInsets.only(right: isGradeIcon == false ? 20: 0),
                  child: suffixIcon,
                ),
                hintText: hintText,
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
          isDynamicItem == true
              ? SizedBox(
                  height: 10,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  // Outline Border
  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: color),
    );
  }
}
