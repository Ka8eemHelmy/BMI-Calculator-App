import 'package:bmi/view_model/bloc/todo/todo_state.dart';
import 'package:bmi/view_model/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/todo/todo_model.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of<TodoCubit>(context);

  List<TodoModel> todos = [];

  int currentIndex = 0;

  void changeIndex(int index){
    currentIndex = index;
    titleController.text = todos[currentIndex].title ?? '';
    descriptionController.text = todos[index].description ?? '';
    startDateController.text = todos[index].startDate ?? '';
    endDateController.text = todos[index].endDate ?? '';
  }
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  Future<void> addTodo() async {
    TodoModel todo = TodoModel(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
    );
    todos.add(todo);
    resetControllers();
    emit(AddTodoState());
  }

  void resetControllers(){
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  Future<void> editTodo() async {
    todos[currentIndex].title = titleController.text;
    todos[currentIndex].description = descriptionController.text;
    todos[currentIndex].startDate = startDateController.text;
    todos[currentIndex].endDate = endDateController.text;
    emit(EditTodoState());
  }

  Future<void> deleteTodo() async {
    todos.removeAt(currentIndex);
    emit(DeleteTodoState());
  }
}