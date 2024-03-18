import 'package:common/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:project_assets/gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).practiceAppColors;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body:
          //Assets.image.image(height: 10),//image generation
          Container(
            color: colors.blue18,
          )

        ));
  }
}
