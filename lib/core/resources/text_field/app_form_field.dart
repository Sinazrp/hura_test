import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    required this.controller,
    required this.noBorder,
    super.key,
    this.onChanged,
    this.hintText,
    this.label,
    this.validator,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    this.textStyle,
    this.inputFormatters,
    this.height,
    this.isReadOnly = false,
    this.textAlignVertical,
    this.onTap,
    this.expands = false,
    this.maxLines = 1,
    this.maxLengthEnforcement,
    this.textInputAction,
    this.suffixIcon,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.isEnabled,
  });
  final bool? isEnabled;
  final double? height;
  final TextEditingController controller;
  final bool isReadOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final String? label;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final VoidCallback? onTap;
  final int? maxLines;
  final bool expands;
  final Color? fillColor;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextInputAction? textInputAction;
  final bool noBorder;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        enabled: isEnabled ?? true,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) =>
            null,
        controller: controller,
        decoration: InputDecoration(
          border: noBorder ? InputBorder.none : border,
          enabledBorder: noBorder ? InputBorder.none : enabledBorder,
          focusedBorder: noBorder ? InputBorder.none : focusedBorder,
          fillColor: fillColor,
          hintText: hintText,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding,
        ),
        style: textStyle,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        onChanged: onChanged,
        readOnly: isReadOnly,
        maxLines: maxLines,
        expands: expands,
        textInputAction: textInputAction,
        textAlignVertical: textAlignVertical,
      ),
    );
  }
}
