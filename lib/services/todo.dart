import 'package:hive/hive.dart';
import 'package:todo_bloc_hive/models/task.dart';

class TodosService {
  late Box<Task> _task;
  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _task = await Hive.openBox('tasks');

    _task.clear();

    await _task.add(Task('Taha', 'Clean the Room', true));
    await _task.add(Task('Taha', 'Read the book', true));
    await _task.add(Task('Taha', 'Go to the GYM', false));
    await _task.add(Task('ali', 'Go to the GYM', false));
    await _task.add(Task('ali', 'Go to the GYM', true));
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

  void updateTask(
      final String mytask, final String username, final bool? completed) async {
    final taskToEdit = _task.values.firstWhere(
        (element) => element.user == username && element.task == mytask);
    final index = taskToEdit.key as int;
    await _task.put(
      index,
      Task(username, mytask, completed ?? taskToEdit.completed),
    );
  }
}
