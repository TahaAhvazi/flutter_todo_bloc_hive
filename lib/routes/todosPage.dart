import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_hive/blocs/todo/todos_bloc.dart';
import 'package:todo_bloc_hive/services/todo.dart';

class TodosPage extends StatelessWidget {
  final String username;
  const TodosPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodosBloc(RepositoryProvider.of<TodosService>(context))
            ..add(LoadTodosEvent(username)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "TODO List",
          ),
        ),
        body: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is TodosLoadedState) {
              return ListView(
                  children: state.tasks
                      .map(
                        (e) => ListTile(
                          title: Text(e.task),
                          trailing: Checkbox(
                            value: e.completed,
                            onChanged:
                                (value) {}, // TODO : we Have to change the state of this
                          ),
                        ),
                      )
                      .toList());
            }
            return const Center(
              child: Text("No TODOS "),
            );
          },
        ),
      ),
    );
  }
}
