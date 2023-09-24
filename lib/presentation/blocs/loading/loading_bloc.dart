// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<LoadingEvent>(_mapLoadingEvent);
  }

  void _mapLoadingEvent(LoadingEvent event, Emitter<LoadingState> emit) async {
    if (event is StartLoading) {
      emit(
        LoadingStarted(),
      );
    } else if (event is FinishedLoading) {
      emit(
        LoadingFinished(),
      );
    }
  }
}
