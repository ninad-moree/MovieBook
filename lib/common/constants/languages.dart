import '../../domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static List<LanguagesEntity> languages = [
    LanguagesEntity(code: 'en', value: 'English'),
    LanguagesEntity(code: 'es', value: 'Spanish'),
  ];
}
