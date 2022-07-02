import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_hive/services/auth.dart';
import 'package:todo_bloc_hive/services/todo.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  final AuthenticationService _auth;
  final TodosService _todosService;
  HomeBloc(this._auth, this._todosService) : super(RegisteringServicesState()) {
    // use the events
    on<LoginEvent>((event, emit) async {
      final user =
          await _auth.authenticatedUser(event.username, event.password);
      if (user != null) {
        emit(SuccesfulLogin(user));
        emit(HomeState());
      }
    });

    on<RegisterServiceEvent>((event, emit) async {
      // TODO: implement event handler
      await _auth.init();
      await _todosService.init();
      emit(HomeState());
    });
  }
}
