import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hura_test/app/routes/app_pages.dart';

import '../../../../core/resources/loading/app_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeSplashScreen();
  }

  Future<void> _initializeSplashScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed<void>(Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const colorizeColors = [
      Color.fromARGB(255, 10, 86, 43),
      Color.fromARGB(255, 33, 243, 96),
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      fontFamily: 'Horizon',
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: SizedBox(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'HURALYA',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 56,
            left: 0,
            right: 0,
            child: Center(
              child: AppLoading(
                width: size.width / 10,
                strokeWidth: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
