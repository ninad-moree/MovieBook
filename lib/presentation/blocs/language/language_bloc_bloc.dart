// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moviebook/common/constants/languages.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/usecases/get_preferred_language.dart';
import 'package:moviebook/domain/usecases/update_language.dart';

import '../../../domain/entities/language_entity.dart';

part 'language_bloc_event.dart';
part 'language_bloc_state.dart';

class LanguageBlocBloc extends Bloc<LanguageBlocEvent, LanguageBlocState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBlocBloc({
    required this.getPreferredLanguage,
    required this.updateLanguage,
  }) : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    on<LanguageBlocEvent>(_mapLanguageBlocEvent);
  }

  void _mapLanguageBlocEvent(
      LanguageBlocEvent event, Emitter<LanguageBlocState> emit) async {
    if (event is ToggleLanguage) {
      await updateLanguage(event.languagesEntity.code);
      add(LoadPreferredLanguageEvent());
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(NoParams());
      response.fold(
        (l) => LanguageError(),
        (r) => LanguageLoaded(Locale(r)),
      );
    }
  }
}
