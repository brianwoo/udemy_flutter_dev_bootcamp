import 'dart:io';

void main() {
  // performTasks();
  performTasksInParallel();
}

void performTasks() async {
  task1();
  String? task2Result = await task2();
  String? task2Result2 = await task2a();
  task3(task2Result);
  task3(task2Result2);
}

void performTasksInParallel() async {
  task1();
  Future<String?> task2Future = task2();
  Future<String?> task2aFuture = task2a();
  task3(await task2Future);
  task3(await task2aFuture);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String?> task2() async {
  print('task2 starts');
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  String? result;

  // Waiting for future to finish and return another future
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

Future<String?> task2a() async {
  print('task2a starts');
  Duration threeSeconds = Duration(seconds: 3);

  // Returning a Future with a pending result.
  return Future.delayed(threeSeconds, () {
    String? result = 'task 2a data';
    print('Task 2a complete');
    return result;
  });
}

void task3(String? task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
