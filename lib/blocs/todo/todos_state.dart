part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];

  get tasks => null;
}

class TodosInitial extends TodosState {}

// This class or state will show the TODOS
class TodosLoadedState extends TodosState {
  final List<Task> tasks;

  TodosLoadedState(this.tasks);
  @override
  // TODO: implement props
  List<Object> get props => [tasks];
}
