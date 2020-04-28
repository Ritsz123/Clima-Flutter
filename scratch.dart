void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String t2 = await task2();
  task3(t2);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  String result;
  Duration three = Duration(seconds: 3);
  await Future.delayed(three, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2data');
}
