import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';

import '../colors.dart';

class AppLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Indicator indicatorType;
  final List<Color> colors;
  final double strokeWidth;
  final Color pathBackgroundColor;

  const AppLoading({
    super.key,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.indicatorType = Indicator.ballRotateChase,
    this.colors = const [AppColors.primary],
    this.strokeWidth = 2,
    this.pathBackgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Center(
        child: LoadingIndicator(
          indicatorType: indicatorType,
          colors: colors,
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          pathBackgroundColor: pathBackgroundColor,
        ),
      ),
    );
  }
}
