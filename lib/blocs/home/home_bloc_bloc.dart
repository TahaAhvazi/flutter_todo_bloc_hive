import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_hive/services/auth.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  final AuthenticationService _auth;
  HomeBloc(this._auth) : super(HomeState()) {
    // use the events
    on<LoginEvent>((event, emit) async {
      final user =
          await _auth.authenticatedUser(event.username, event.password);
      if (user != null) {
        emit(
          SuccesfulLogin(username: user),
        );
      }
    });
  }
}
