import 'package:common/common.dart';
import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_assets/gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).myAppColors;
    return ScreenUtilInit(
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Screen Util',
              theme: ThemeData(
                package: AutofillHints.creditCardExpirationDate,
                colorScheme: ColorScheme.fromSeed(seedColor: colors.blue18),
                useMaterial3: true,
              ),
              home: Scaffold(
                  appBar: AppBarWidget(),
                  body: Container(
                    //child: Assets.image.image(height: 10), //image generation
                    child:
                        // PrimaryButton(text: 'hiii', onPressed: () { print("object");},
                        // ),
                        Center(
                            child: CustomCheckbox(
                      onChecked: () {},
                      isChecked: false,
                    )),

                    //theme color calling
                  )),
            ));
  }
}
