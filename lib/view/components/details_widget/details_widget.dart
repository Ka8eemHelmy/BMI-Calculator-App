import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import '../../../view_model/utils/colors.dart';

class DetailsWidget extends StatelessWidget {
  final String text;
  final int value;
  final void Function()? onAddPressed;
  final void Function()? onMinusPressed;

  const DetailsWidget({required this.text, required this.value, required this.onAddPressed, required this.onMinusPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        children: [
          TextCustom(
            text: text,
          ),
          const SizedBox(height: 12),
          TextCustom(
            text: '$value',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: onMinusPressed,
                backgroundColor: AppColors.grey,
                shape: const CircleBorder(),
                mini: true,
                child: const Icon(
                  Icons.remove,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 12),
              FloatingActionButton(
                onPressed: onAddPressed,
                backgroundColor: AppColors.grey,
                shape: const CircleBorder(),
                mini: true,
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
