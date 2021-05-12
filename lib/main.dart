import 'package:flutter/material.dart';
import 'package:myapp/models/task_data.dart';
import 'package:myapp/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }
void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Data()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
