import 'package:hive/hive.dart';
import 'package:todo_bloc_hive/models/task.dart';

class TodosService {
  late Box<Task> _task;
  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _task = await Hive.openBox('tasks');
  }

  Future<List<Task>> getTasks(final String username) async {
    final tasks = _task.values.where((element) => element.user == username);
    return tasks.toList();
  }

  void addTask(final String myTask, final String username) {
    final task = _task.add(Task(username, myTask, false));
  }

  void removeTask(final String myTask, final String username) async {
    final task = _task.values.firstWhere(
        (element) => element.task == myTask && element.user == username);
    await task.delete();
  }
}
