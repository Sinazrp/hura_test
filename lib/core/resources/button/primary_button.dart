import 'package:flutter/material.dart';
import 'package:hura_test/core/resources/loading/app_loading.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    this.onTap,
    this.isLoading = false,
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  final String title;
  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isButtonEnabled = onTap != null;

    final textColor = isButtonEnabled
        ? theme.elevatedButtonTheme.style?.foregroundColor?.resolve({})
        : theme.elevatedButtonTheme.style?.foregroundColor
            ?.resolve({WidgetState.disabled});

    final backgroundColor = isButtonEnabled
        ? theme.elevatedButtonTheme.style?.backgroundColor?.resolve({})
        : theme.elevatedButtonTheme.style?.backgroundColor
            ?.resolve({WidgetState.disabled});

    return GestureDetector(
      onTap: !isButtonEnabled || isLoading ? null : onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const AppLoading(
                height: 24,
                width: 24,
                strokeWidth: 4,
                colors: [Colors.white],
              )
            : Text(
                title,
                style: TextStyle(
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
