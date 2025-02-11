import 'package:dartz/dartz.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/api_response_entity.dart';

abstract class FetchMoteisUseCase {
  Future<Either<Failure, ApiResponseEntity>> fetchMoteis();
}
