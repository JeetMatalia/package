import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showLoadingDialog(BuildContext context, bool status) {
  if (status) {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopScope(
           canPop: false,// Return false directly
          child: const CustomProgressIndicator(),
        );
      },
    );
  } else if (!status) {
    Navigator.of(context).pop();
  }
}

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  CustomProgressIndicatorState createState() => CustomProgressIndicatorState();
}

class CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).myAppColors;
    return Container(
      color: Colors.transparent,
      height: 200.0,
      width: 200.0,
      alignment: Alignment.center,
      child: SpinKitCircle(
        color: color.primary,
        size: 70.0,
      ),
    );
  }
}
