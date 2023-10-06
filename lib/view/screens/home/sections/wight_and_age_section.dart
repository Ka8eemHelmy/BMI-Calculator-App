import 'package:bmi/view/screens/home/home_screen.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:bmi/view_model/bloc/bmi_cubit/bmi_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../components/details_widget/details_widget.dart';

class WightAndAgeSection extends StatelessWidget {
  const WightAndAgeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit, BMIStates>(
      listener: (context, state) {
        print(state);
        if(state is BMIAgeOverState){
          BMICubit.get(context).calculateBMI();
          Fluttertoast.showToast(
              msg: state.message ?? '',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        BMICubit cubit = BMICubit.get(context);
        return Row(
          children: [
            Expanded(
              child: DetailsWidget(
                text: 'Weight',
                value: cubit.weightValue,
                onAddPressed: () {
                  cubit.addWeightValue();
                },
                onMinusPressed: () {
                  cubit.minusWeightValue();
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailsWidget(
                text: 'Age',
                value: cubit.ageValue,
                onAddPressed: () {
                  cubit.addAgeValue(context);
                },
                onMinusPressed: () {
                  cubit.minusAgeValue();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
