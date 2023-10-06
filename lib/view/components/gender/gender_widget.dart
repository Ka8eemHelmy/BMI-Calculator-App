import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  final bool isSelected;

  const GenderWidget({required this.icon, required this.text, this.onTap , this.isSelected = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      onTap: onTap,
      isSelected: isSelected,
      child: Column(
        children: [
          Icon(
            icon,
            size: 60,
            color: AppColors.white,
          ),
          const SizedBox(height: 12),
          TextCustom(
            text: text,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
