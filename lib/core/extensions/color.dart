import 'package:flutter/material.dart';

extension ColorExtensions on BuildContext {
  ColorScheme get getScheme => Theme.of(this).colorScheme;
}
