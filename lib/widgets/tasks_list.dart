import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          // Add BouncingScrollPhysics to make it scrolable
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

// return ListView(
//       physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//       children: [
//         TaskTile(
//           taskTitle: tasks[0].name,
//           isChecked: tasks[0].isDone,
//         ),
//         TaskTile(
//           taskTitle: tasks[1].name,
//           isChecked: tasks[1].isDone,
//         ),
//         TaskTile(
//           taskTitle: tasks[2].name,
//           isChecked: tasks[2].isDone,
//         ),
//       ],
//     );
