import 'package:dartz/dartz.dart';
import 'package:guia_de_moteis_application/app/core/services/network_checker/network_checker_service.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/api_response_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/repositories/fetch_moteis/fetch_moteis_repository.dart';

class FetchMoteisRepositoryImpl implements FetchMoteisRepository {
  final FetchMoteisRemoteDataSource _fetchMoteisRemoteDataSource;
  final NetworkCheckerService _networkCheckerService;

  FetchMoteisRepositoryImpl(
      this._fetchMoteisRemoteDataSource, this._networkCheckerService);

  @override
  Future<Either<Failure, ApiResponseEntity>> fetchMoteis() async {
    if (await _networkCheckerService.isConnected) {
      try {
        final response = await _fetchMoteisRemoteDataSource.fetchMoteis();

        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
