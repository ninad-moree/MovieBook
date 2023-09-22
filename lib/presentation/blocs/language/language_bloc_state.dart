part of 'language_bloc_bloc.dart';

sealed class LanguageBlocState extends Equatable {
  const LanguageBlocState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageBlocState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageBlocState {}
