import 'package:dartz/dartz.dart';
import 'package:moviebook/domain/entities/app_error.dart';
import 'package:moviebook/domain/entities/no_params.dart';
import 'package:moviebook/domain/repositories/app_repository.dart';
import 'package:moviebook/domain/usecases/usecase.dart';

class GetPreferredLanguage extends Usecase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}
