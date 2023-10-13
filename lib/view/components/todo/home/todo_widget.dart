import 'package:bmi/model/todo/todo_model.dart';
import 'package:bmi/view_model/utils/images.dart';
import 'package:flutter/material.dart';
import '../../../../view_model/utils/colors.dart';
import '../../widgets/text_custom.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todo;
  final void Function()? onTap;

  const TodoWidget({required this.todo, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.pink,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: todo.title ?? '',
              color: AppColors.black,
              fontSize: 20,
            ),
            // if(todo.description != null)
            Visibility(
              visible: todo.description != null,
              child: TextCustom(
                text: todo.description ?? '',
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
