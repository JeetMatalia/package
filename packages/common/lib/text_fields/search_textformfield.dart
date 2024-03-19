import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    Key? key,
    required this.onChanged,
    required this.onSearchCloseTap,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;
  final void Function(String) onChanged;
  final Function()? onSearchCloseTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).myAppColors;
    return TextFormField(
      style: TextStyle(
        color: colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      controller: searchController,

      // autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        hintText: 'Search',
        suffixIconConstraints: BoxConstraints(
          maxHeight: 80,
          maxWidth: 80,
        ),
        suffixIcon: searchController.text.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: () => onSearchCloseTap!(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.close, color: colors.red),
                  ),
                ),
              )
            : SizedBox.shrink(),
        hintStyle: TextStyle(
          color: colors.grey88,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.greyBD,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.greyBD,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.greyBD,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.greyBD,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onChanged: (value) => onChanged(value),
    );
  }
}
