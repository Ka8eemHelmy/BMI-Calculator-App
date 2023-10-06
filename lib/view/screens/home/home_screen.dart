import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/bloc/bmi_cubit/bmi_states.dart';
import '../result_bmi/result_bmi_screen.dart';
import 'sections/gender_section.dart';
import 'sections/height_section.dart';
import 'sections/wight_and_age_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const TextCustom(
          text: 'BMI Calculator',
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                GenderSection(),
                SizedBox(
                  height: 12,
                ),
                HeightSection(),
                SizedBox(
                  height: 12,
                ),
                WightAndAgeSection(),
              ],
            ),
          ),
          SafeArea(
            child: BlocConsumer<BMICubit, BMIStates>(
              listener: (context, state) {
                if (state is BMICalculateSuccessState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultBMIScreen();
                      },
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pink,
                    minimumSize: const Size(double.infinity, 70),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: state is! BMICalculateLoadingState
                      ? () {
                          BMICubit.get(context).calculateBMI();
                        }
                      : () {},
                  child: Visibility(
                      visible: state is! BMICalculateLoadingState,
                      child: const TextCustom(
                        text: 'CALCULATE',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      replacement: const CircularProgressIndicator(
                        color: AppColors.white,
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
