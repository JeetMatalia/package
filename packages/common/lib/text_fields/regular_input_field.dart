import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegularInputField extends StatelessWidget {
  final bool? enabled;
  final TextEditingController controller;
  final Function(String?) validation;
  final Function(String?)? onChange;
  final Function()? onTap;
  final double? fontSize;
  final double? hintFontSize;
  final double? fontHeight;
  final String label;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final bool? isNumberKeyboard;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Color? hintTextColor;
  final Widget? prefixIcon;
  final bool? isGradeIcon;
  final bool isMsgField;
  final bool? isNormalField;
  final bool? obscureText;
  final double? height;
  final bool isValidatorCompulsory;
  final bool? isLocationField;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool? isNotDatePicker;
  final OutlineInputBorder? outlineInputBorder;
  final InputBorder? inputBorder;
  const RegularInputField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onChange,
    required this.validation,
    required this.hintText,
    this.enabled,
    this.label = '',
    this.fontSize,
    this.hintFontSize,
    this.contentPadding,
    this.maxLines,
    this.height,
    this.isNumberKeyboard,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.maxLength,
    this.isGradeIcon,
    this.isMsgField = false,
    this.suffixIconConstraints,
    this.inputFormatters,
    required this.isValidatorCompulsory,
    this.textInputAction,
    this.textStyle,
    this.hintTextColor,
    this.isLocationField,
    this.onTap,
    this.isNormalField,
    this.obscureText,
    this.isNotDatePicker,
    this.outlineInputBorder,
    this.prefixIconConstraints,
    this.fontHeight,
    this.inputBorder,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).myAppColors;

    /// KeyboardType
    ///
    final keyBoardType =
        (maxLines ?? 1) > 1 ? TextInputType.multiline : TextInputType.text;

    // Border
    final border = outlineInputBorder ??
        _outlineBorder(
          enabled == false || isMsgField
              ? isLocationField == true
                  ? color.darkBlue25.withOpacity(0.28)
                  : Colors.transparent
              : color.darkBlue25.withOpacity(0.28),
        );

    return SizedBox(
      height: height,
      child: TextFormField(
        focusNode: focusNode,
        obscureText: obscureText == true ? true : false,
        textAlign: textAlign,
        enabled: isNotDatePicker ?? enabled ?? true,
        onChanged: onChange,
        onTap: onTap,
        maxLength: maxLength,
        controller: controller,
        textInputAction: textInputAction ??
            ((maxLines ?? 1) > 1
                ? TextInputAction.newline
                : TextInputAction.next),
        validator: (value) => isValidatorCompulsory ? validation(value) : null,
        inputFormatters: inputFormatters,
        keyboardType: isNumberKeyboard == true
            ? const TextInputType.numberWithOptions(decimal: true, signed: true)
            : keyBoardType,
        maxLines: maxLines ?? 1,
        textCapitalization: TextCapitalization.sentences,
        style: textStyle ??
            TextStyle(
              color: enabled == false
                  ? color.black.withOpacity(0.50)
                  : color.black,
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w400,
              height: fontHeight,
            ),
        readOnly: isLocationField == true ? true : false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: color.greyB6.withOpacity(0.20),
          filled: enabled == false || isMsgField
              ? isLocationField == true
                  ? false
                  : true
              : false,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          errorMaxLines: 3,
          suffixIconConstraints: suffixIconConstraints,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: isMsgField
              ? null
              : isNormalField == true
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(
                          right: isGradeIcon == false ? 20 : 0),
                      child: suffixIcon,
                    ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: hintFontSize ?? 14,
            color: hintTextColor ?? color.greyB6,
            height: fontHeight,
          ),
          prefixIcon: prefixIcon,
          enabledBorder: inputBorder ?? border,
          border: inputBorder ?? border,
          focusedErrorBorder: border,
          focusedBorder: border,
          errorBorder: border,
          disabledBorder: border,
        ),
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
