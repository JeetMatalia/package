import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.onChecked,
    required this.isChecked,
  }) : super(key: key);

  final bool isChecked;
  final Function() onChecked;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).myAppColors;

    return InkWell(
      onTap: () => onChecked(),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color.whiteF5F5,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: color.grey324.withOpacity(0.60),
          ),
        ),
        alignment: Alignment.center,
        child: isChecked
            ? Icon(
          Icons.check,
          size: 16,
          color: color.grey324.withOpacity(0.60),
        )
            : null,
      ),
    );
  }
}
