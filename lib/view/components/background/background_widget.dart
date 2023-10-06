import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final bool isSelected;
  const BackgroundWidget({required this.child, this.onTap, this.isSelected = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondBackground,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: isSelected ? Border.all(
              color: AppColors.pink,
              width: 2,
            ) : null,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: child,
        ),
      ),
    );
  }
}
