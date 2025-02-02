import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgPic extends StatelessWidget {
  const AppSvgPic(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.colorFilter,
  });

  final String assetName;
  final double? width;
  final double? height;
  final Color? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter: colorFilter != null
          ? ColorFilter.mode(
              colorFilter!,
              BlendMode.srcIn,
            )
          : null,
      width: width,
      height: height,
    );
  }
}
