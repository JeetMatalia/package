import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DatePickField extends StatefulWidget {
  final bool? enabled;
  final TextEditingController controller;
  final Function(String?) validation;
  final Function(String?)? onChange;
  final double? fontSize;
  final String label;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final bool? isNumberKeyboard;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? isGradeIcon;
  final double? height;
  final BoxConstraints? suffixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final Function(bool, DateTime)? validateForDate;


  const DatePickField({
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
    this.inputFormatters, this.validateForDate,
  });

  @override
  State<DatePickField> createState() => _DatePickFieldState();
}

class _DatePickFieldState extends State<DatePickField> {
  @override
  Widget build(BuildContext context) {
  final color = Theme.of(context).myAppColors;
    ;

    /// KeyboardType
    ///
    final keyBoardType = (widget.maxLines ?? 1) > 1
        ? TextInputType.multiline
        : TextInputType.text;

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
            height: 10,
          ),
          SizedBox(
            height: widget.height,
            child: TextFormField(
              enabled: widget.enabled ?? true,
              onChanged: widget.onChange,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  setState(() {
                    widget.controller.text =
                        pickedDate.toString().split(" ").first.toString();
                    widget.validateForDate!(true, pickedDate);
                  });
                } else {}
              },
              readOnly: true,
              maxLength: widget.maxLength,
              controller: widget.controller,
              textInputAction: (widget.maxLines ?? 1) > 1
                  ? TextInputAction.newline
                  : TextInputAction.next,
              validator: (value) => widget.validation(value),
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.isNumberKeyboard == true
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : keyBoardType,
              maxLines: widget.maxLines ?? 1,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                color: color.black,
                fontSize: widget.fontSize ?? 14,
                fontWeight: FontWeight.w400,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                errorMaxLines: 3,
                suffixIconConstraints: widget.suffixIconConstraints,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right: widget.isGradeIcon == false ? 20 : 0),
                  child: widget.suffixIcon,
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
          SizedBox(
            height: 10,
          ),
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

