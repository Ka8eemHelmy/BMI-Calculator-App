import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view/screens/todo/home/add_todo_screen.dart';
import 'package:bmi/view/screens/todo/home/edit_todo_screen.dart';
import 'package:bmi/view_model/bloc/todo/todo_cubit.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:bmi/view_model/utils/images.dart';
import 'package:bmi/view_model/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../model/todo/todo_model.dart';
import '../../../../view_model/bloc/todo/todo_state.dart';
import '../../../components/todo/home/todo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: TextCustom(
          text: 'Todo App',
        ),
      ),
      body: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Visibility(
            visible: cubit.todos.isNotEmpty,
            replacement: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.network(
                    AppImages.empty,
                    height: 300,
                  ),
                  const SizedBox(height: 12,),
                  const TextCustom(
                    text: 'No Tasks added yet!',
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return TodoWidget(
                  todo: cubit.todos[index],
                  onTap: (){
                    cubit.changeIndex(index);
                    Navigation.push(context, EditTodoScreen());
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: cubit.todos.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation.push(context, const AddTodoScreen());
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.background,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
