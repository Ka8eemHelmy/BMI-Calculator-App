import 'package:flutter/material.dart';
import '../../../view_model/utils/colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final Color? mainColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final bool? readOnly;
  final String? labelText;
  final IconData? icon;

  const TextFormFieldCustom({
    this.controller,
    this.mainColor = AppColors.pink,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.readOnly = false,
    this.labelText,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: mainColor,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onTap: onTap,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        focusColor: mainColor,
        floatingLabelStyle: TextStyle(
          color: mainColor,
        ),
        prefixIcon: icon != null ? Icon(
          icon,
          color: mainColor,
        ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.background,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.background,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: mainColor ?? AppColors.pink,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
