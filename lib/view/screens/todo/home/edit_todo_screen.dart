import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../view_model/bloc/todo/todo_cubit.dart';
import '../../../../view_model/utils/colors.dart';
import '../../../../view_model/utils/functions.dart';
import '../../../components/widgets/text_custom.dart';
import '../../../components/widgets/text_form_field_custom.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TodoCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const TextCustom(
          text: 'Edit Todo',
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Form(
        key: cubit.formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormFieldCustom(
                        controller: cubit.titleController,
                        labelText: 'Title',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormFieldCustom(
                        controller: cubit.descriptionController,
                        labelText: 'Description',
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormFieldCustom(
                        controller: cubit.startDateController,
                        labelText: 'Start Date',
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019, 5, 21),
                            lastDate: DateTime.now().add(
                              Duration(days: 365 * 5),
                            ),
                          ).then((value) {
                            if (value != null) {
                              cubit.startDateController.text = DateFormat('yyyy/MM/dd').format(value);
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormFieldCustom(
                        controller: cubit.endDateController,
                        labelText: 'End Date',
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019, 5, 21),
                            lastDate: DateTime.now().add(
                              Duration(days: 365 * 5),
                            ),
                          ).then((value) {
                            if(value != null){
                              cubit.endDateController.text = DateFormat('yyyy/MM/dd').format(value);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.pink,
                          minimumSize: const Size(double.infinity, 70),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate()){
                            cubit.editTodo().then((value) {
                              Navigator.pop(context);
                              Functions.showToast(
                                  message: 'Edit Successfully'
                              );
                            });
                          }
                        },
                        child: const TextCustom(
                          text: 'Edit todo',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          minimumSize: const Size(double.infinity, 70),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate()){
                            cubit.deleteTodo().then((value) {
                              Functions.showToast(
                                message: 'Deleted Successfully',
                                background: AppColors.red,
                              );
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const TextCustom(
                          text: 'Delete',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
