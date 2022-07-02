import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_hive/models/task.dart';
import 'package:todo_bloc_hive/services/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosService _todosService;
  TodosBloc(this._todosService) : super(TodosInitial()) {
    on<TodosEvent>((event, emit) {
      on<LoadTodosEvent>((event, emit) async {
        final todos = await _todosService.getTasks(event.username);
        emit(TodosLoadedState(todos));
      });
    });
  }
}
