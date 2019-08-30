class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggle() {
    isDone = !isDone;
  }
}
