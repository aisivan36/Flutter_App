class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    // To show that isDone changes from "default" false to true
    isDone = !isDone; // Default false the it trigress by clicking checkbox.
    // it will change to true
  }
}
