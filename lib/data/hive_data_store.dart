import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_todos_app/models/task.dart';

class HiveDataStore {
  static const boxName = "tasksBox";
  final Box<Task> box = Hive.box(boxName);

  //Add new Task
  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  //show Task
  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  //update Task
  Future<void> updateTask({required Task task}) async {
    await task.save();
  }

  //Delete Task
  Future<void> deleteTask({required Task task}) async {
    await task.delete();
  }

  ValueListenable<Box<Task>> listenToTask() {
    return box.listenable();
  }
}
