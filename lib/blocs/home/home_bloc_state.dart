part of 'home_bloc_bloc.dart';

class HomeBlocState extends Equatable {
  final bool? success;
  const HomeBlocState({required this.success});

  factory HomeBlocState.initial() {
    return const HomeBlocState(
      success: false,
    );
  }

  @override
  List<Object?> get props => [success];
}
