part of 'home_bloc_bloc.dart';

class HomeState extends Equatable {
  HomeState();

  @override
  List<Object?> get props => [];
}

class SuccesfulLogin extends HomeState {
  final String username;
  SuccesfulLogin({required this.username});

  @override
  List<Object?> get props => [username];
}
