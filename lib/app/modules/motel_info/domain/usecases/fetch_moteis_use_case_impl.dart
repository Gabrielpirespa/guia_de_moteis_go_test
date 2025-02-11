import 'package:dartz/dartz.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/api_response_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/repositories/fetch_moteis/fetch_moteis_repository.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case.dart';

class FetchMoteisUseCaseImpl implements FetchMoteisUseCase {
  final FetchMoteisRepository _repository;

  FetchMoteisUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, ApiResponseEntity>> fetchMoteis() {
    return _repository.fetchMoteis();
  }
}
