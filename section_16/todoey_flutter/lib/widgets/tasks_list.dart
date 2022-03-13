import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget? child) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 16.0,
          ),
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: () => taskData.updateTask(task),
              deleteTaskCallback: () => taskData.deleteTask(task),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
