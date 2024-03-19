import 'package:common/common.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownInputField extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final String hint;
  final Widget? icon;
  final String? Function(String?) validation;
  final ValueChanged<String> onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;

  const DropdownInputField({
    super.key,
    required this.items,
    this.selectedItem,
    required this.onChanged,
    required this.hint,
    this.icon,
    required this.validation,
    this.contentPadding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).myAppColors;

    return ButtonTheme(
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        isDense: true,
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: EdgeInsets.only(right: 0),
            child: icon,
          ),
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding ??
              EdgeInsets.only(
                left: 24,
                top: 16,
                bottom: 16,
              ),
          errorMaxLines: 3,
          border: _outlineBorder(borderColor ?? color.greyC2.withOpacity(0.28)),
          errorBorder:
              _outlineBorder(borderColor ?? color.darkBlue25.withOpacity(0.28)),
          focusedBorder:
              _outlineBorder(borderColor ?? color.darkBlue25.withOpacity(0.28)),
          focusedErrorBorder:
              _outlineBorder(borderColor ?? color.darkBlue25.withOpacity(0.28)),
          enabledBorder:
              _outlineBorder(borderColor ?? color.darkBlue25.withOpacity(0.28)),
        ),
        hint: Transform.translate(
          offset: Offset(-15, 0),
          child: Text(
            hint,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color.greyC2,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        value: selectedItem,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color.black,
        ),
        selectedItemBuilder: (context) {
          return items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Transform.translate(
                offset: Offset(-15, 0),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: color.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              // child: Text(item),
            );
          }).toList();
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: color.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            // child: Text(item),
          );
        }).toList(),
        onChanged: (newValue) {
          onChanged(newValue!);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
