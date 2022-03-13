import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function() checkboxCallback;
  final void Function() deleteTaskCallback;

  // void checkboxCallback(newValue) {}

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.deleteTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => deleteTaskCallback(),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            fontSize: 18.0,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallback();
          },
        ),
      ),
    );
  }
}
