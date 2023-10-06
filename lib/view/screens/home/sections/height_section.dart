import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_states.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightSection extends StatelessWidget {
  const HeightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit, BMIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BackgroundWidget(
          child: Column(
            children: [
              const TextCustom(
                text: 'Height',
              ),
              const SizedBox(height: 12),
              TextCustom(
                text: '${BMICubit.get(context).heightValue.round()} cm',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 12,
              ),
              Slider(
                value: BMICubit.get(context).heightValue,
                min: 0,
                max: 300,
                activeColor: AppColors.pink,
                inactiveColor: AppColors.grey,
                onChanged: (value) {
                  BMICubit.get(context).changeHeightSlider(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
