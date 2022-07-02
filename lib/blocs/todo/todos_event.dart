part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

// THis Class or event will get The TODOS base on the usernames
class LoadTodosEvent extends TodosEvent {
  final String username;
  LoadTodosEvent(this.username);

  @override
  // TODO: implement props
  List<Object> get props => [username];
}
