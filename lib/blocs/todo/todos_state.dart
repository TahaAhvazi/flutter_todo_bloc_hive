part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

// This class or state will show the TODOS
class TodosLoadedState extends TodosState {
  final List<Task> task;

  TodosLoadedState(this.task);
  @override
  // TODO: implement props
  List<Object> get props => [task];
}
