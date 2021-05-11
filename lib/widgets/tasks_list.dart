import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Add BouncingScrollPhysics to make it scrolable
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
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
