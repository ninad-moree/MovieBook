// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/cast_entity.dart';
import 'package:moviebook/domain/entities/movie_params.dart';
import 'package:moviebook/domain/usecases/get_cast_crew.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCastCrew getCastCrew;

  CastBloc({required this.getCastCrew}) : super(CastInitial()) {
    on<LoadCastEvent>(_mapLoadCastEvent);
  }

  void _mapLoadCastEvent(LoadCastEvent event, Emitter<CastState> emit) async {
    Either<AppError, List<CastEntity>> eitherResponse = await getCastCrew(
      MovieParams(event.movieId),
    );

    emit(
      eitherResponse.fold(
        (l) => CastError(),
        (r) => CastLoaded(casts: r),
      ),
    );
  }
}
