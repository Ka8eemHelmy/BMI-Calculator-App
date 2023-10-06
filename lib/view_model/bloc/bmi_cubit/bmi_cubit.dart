import 'package:bmi/view/screens/home/home_screen.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIStates> {
  BMICubit() : super(BMIInitialState());

  static BMICubit get(context) => BlocProvider.of<BMICubit>(context);

  bool isMale = true;

  void changeGender(String gender) {
    if (gender == 'male') {
      isMale = true;
    } else {
      isMale = false;
    }
    emit(BMIChangeGenderState());
  }

  double heightValue = 150;

  void changeHeightSlider(double value) {
    heightValue = value.roundToDouble();
    emit(BMIChangeHeightSliderState());
  }

  int weightValue = 50;

  void addWeightValue() {
    weightValue++;
    emit(BMIAddWeightValueState());
  }

  void minusWeightValue() {
    weightValue--;
    emit(BMIMinusWeightValueState());
  }

  int ageValue = 25;

  void addAgeValue(context) {
    if (ageValue == 100) {
      emit(
        BMIAgeOverState(
          message: 'Age must be less than 100 This inside Cubit',
        ),
      );
      return;
    }
    ageValue++;
    emit(BMIAddAgeValueState());
  }

  void minusAgeValue() {
    ageValue--;
    emit(BMIMinusAgeValueState());
  }

  double bmiValue = 0;

  void calculateBMI() {
    emit(BMICalculateLoadingState());
    Future.delayed(Duration(seconds: 2), (){
      bmiValue = weightValue / ((heightValue / 100) * (heightValue / 100));
      emit(BMICalculateSuccessState());
    });
  }
}
