import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocState.initial()) {
    // use the events
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
