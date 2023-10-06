import 'package:bmi/view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/gender/gender_widget.dart';

class GenderSection extends StatelessWidget {
  const GenderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit, BMIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: GenderWidget(
                text: 'Male',
                icon: Icons.male_rounded,
                isSelected: BMICubit.get(context).isMale,
                onTap: () {
                  BMICubit.get(context).changeGender('male');
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GenderWidget(
                text: 'Female',
                isSelected: !BMICubit.get(context).isMale,
                onTap: () {
                  BMICubit.get(context).changeGender('female');
                },
                icon: Icons.female_rounded,
              ),
            ),
          ],
        );
      },
    );
  }
}
