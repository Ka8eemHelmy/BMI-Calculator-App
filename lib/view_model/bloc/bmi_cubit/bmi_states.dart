abstract class BMIStates {}

class BMIInitialState extends BMIStates {}

class BMIChangeGenderState extends BMIStates {}

class BMIChangeHeightSliderState extends BMIStates {}

class BMIAddWeightValueState extends BMIStates {}

class BMIMinusWeightValueState extends BMIStates {}

class BMIAddAgeValueState extends BMIStates {}

class BMIMinusAgeValueState extends BMIStates {}

class BMIAgeOverState extends BMIStates {
  final String? message;

  BMIAgeOverState({this.message});
}

class BMICalculateLoadingState extends BMIStates {}

class BMICalculateSuccessState extends BMIStates {}
