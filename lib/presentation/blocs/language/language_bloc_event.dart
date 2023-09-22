part of 'language_bloc_bloc.dart';

sealed class LanguageBlocEvent extends Equatable {
  const LanguageBlocEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguage extends LanguageBlocEvent {
  final LanguagesEntity languagesEntity;

  const ToggleLanguage(this.languagesEntity);

  @override
  List<Object> get props => [languagesEntity];
}

class LoadPreferredLanguageEvent extends LanguageBlocEvent {}
