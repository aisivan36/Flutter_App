import 'package:flutter/material.dart';
import 'package:myapp/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      // This color is intended for border radius that allows us to make edges at the top left and top right
      // margin: const EdgeInsets.only(top: 1),

      color: Color(0xff757575),
      //
      child: Container(
        // foregroundDecoration: BoxDecoration(color: Color(0xff757575)),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          // This color is for decoration to make edges window
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        // margin: const EdgeInsets.only(top: 180),

        child: Column(
          // CrossAxissAlignment is for extending buttom TextButton
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              // If we specified "crossAxisAlignment" we have to add this textAlign to be center because we wanna make it the text to be center
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              onPressed: () {
                // Provider.of<TaskData>(context, listen: false)
                //     .
                addTaskCallback(newTaskTitle);
              },
              child: Text('Submit'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.green,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
