part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends HomeBlocEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [username, password];

  @override
  String toString() {
    // TODO: implement toString
    return 'Authentication event (USERNAME : $username PASSWORD: $password)';
  }
}

class RegisterServiceEvent extends HomeBlocEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
