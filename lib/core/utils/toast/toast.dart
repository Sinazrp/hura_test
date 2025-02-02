import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hura_test/core/resources/app_svg.dart';
import 'package:toastification/toastification.dart';

import '../../resources/colors.dart';

const padding = EdgeInsets.symmetric(
  vertical: 12,
  horizontal: 16,
);
const margin = EdgeInsets.symmetric(
  vertical: 14,
  horizontal: 8,
);
final textStyle = TextStyle(color: AppColors.white, height: 1);
const borderRadius = BorderRadius.all(Radius.circular(12));

void displayErrorToast(BuildContext context, String content) {
  toastification.showCustom(
    context: context,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 5),
    builder: (context, item) => GestureDetector(
      onTap: () {
        toastification.dismiss(item);
      },
      onHorizontalDragEnd: (details) {
        toastification.dismiss(item);
      },
      child: Container(
        width: double.infinity,
        padding: padding,
        margin: margin,
        decoration: const BoxDecoration(
          color: AppColors.error,
          borderRadius: borderRadius,
          boxShadow: lowModeShadow,
        ),
        child: Row(
          children: [
            AppSvgPic(
              'assets/svg/octagon-times.svg',
              width: 20,
              height: 20,
            ),
            const Gap(12),
            Text(
              content,
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    ),
  );
}

void displaySuccessToast(BuildContext context, String content) {
  toastification.showCustom(
    context: context,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 5),
    callbacks: ToastificationCallbacks(onTap: toastification.dismiss),
    builder: (context, item) => GestureDetector(
      onTap: () {
        toastification.dismiss(item);
      },
      onHorizontalDragEnd: (details) {
        toastification.dismiss(item);
      },
      child: Container(
        width: double.infinity,
        padding: padding,
        margin: margin,
        decoration: const BoxDecoration(
          color: AppColors.success,
          borderRadius: borderRadius,
          boxShadow: lowModeShadow,
        ),
        child: Row(
          children: [
            AppSvgPic(
              'assets/svg/check-circle.svg',
              width: 20,
              height: 20,
            ),
            const Gap(12),
            Text(
              content,
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    ),
  );
}

void displayWarningToast(BuildContext context, String content) {
  toastification.showCustom(
    context: context,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 5),
    callbacks: ToastificationCallbacks(onTap: toastification.dismiss),
    builder: (context, item) => GestureDetector(
      onTap: () {
        toastification.dismiss(item);
      },
      onHorizontalDragEnd: (details) {
        toastification.dismiss(item);
      },
      child: Container(
        width: double.infinity,
        padding: padding,
        margin: margin,
        decoration: const BoxDecoration(
          color: AppColors.warning,
          borderRadius: borderRadius,
          boxShadow: lowModeShadow,
        ),
        child: Row(
          children: [
            AppSvgPic(
              'assets/svg/triangle-exclamation.svg',
              width: 20,
              height: 20,
            ),
            const Gap(122),
            Text(
              content,
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    ),
  );
}

void displayFlutterToast({
  required BuildContext context,
  required String content,
  required Color backgroundColor,
  required Color borderColor,
}) {
  toastification.showCustom(
    context: context,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 5),
    callbacks: ToastificationCallbacks(onTap: toastification.dismiss),
    builder: (context, item) => GestureDetector(
      onTap: () {
        toastification.dismiss(item);
      },
      onHorizontalDragEnd: (details) {
        toastification.dismiss(item);
      },
      child: Container(
        width: double.infinity,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: borderRadius,
          boxShadow: lowModeShadow,
        ),
        child: Text(
          content,
          style: textStyle,
          textAlign: TextAlign.right,
        ),
      ),
    ),
  );
}
