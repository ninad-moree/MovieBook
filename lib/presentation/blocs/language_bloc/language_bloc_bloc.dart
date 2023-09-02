// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moviebook/common/constants/languages.dart';

import '../../../domain/entities/language_entity.dart';

part 'language_bloc_event.dart';
part 'language_bloc_state.dart';

class LanguageBlocBloc extends Bloc<LanguageBlocEvent, LanguageBlocState> {
  LanguageBlocBloc()
      : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    on<ToggleLanguage>(_mapToggleLanguageEventToState);
  }

  void _mapToggleLanguageEventToState(
      ToggleLanguage event, Emitter<LanguageBlocState> emit) {
    emit(
      LanguageLoaded(
        Locale(event.languagesEntity.code),
      ),
    );
  }
}
