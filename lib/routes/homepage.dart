import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_hive/blocs/home/home_bloc_bloc.dart';
import 'package:todo_bloc_hive/routes/todosPage.dart';
import 'package:todo_bloc_hive/services/auth.dart';
import 'package:todo_bloc_hive/services/todo.dart';

import '../blocs/home/home_bloc_bloc.dart';

class HomePage extends StatelessWidget {
  final userNameField = TextEditingController();
  final passwordField = TextEditingController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY TODO APP'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<AuthenticationService>(context),
          RepositoryProvider.of<TodosService>(context),
        )..add(RegisterServiceEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccesfulLogin) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TodosPage(username: state.username),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeState) {
              return Column(
                children: [
                  TextField(
                    controller: userNameField,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  TextField(
                    controller: passwordField,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                            LoginEvent(
                                username: userNameField.text,
                                password: passwordField.text),
                          );
                    },
                    child: const Text("LOGIN"),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
