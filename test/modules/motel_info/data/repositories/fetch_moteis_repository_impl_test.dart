import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_application/app/core/services/network_checker/network_checker_service.dart';
import 'package:guia_de_moteis_application/app/core/services/network_checker/network_cheker_service_impl.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/repositories/fetch_moteis_repository_impl.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/repositories/fetch_moteis/fetch_moteis_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_values/test_classes.dart';

class _MockFetchMoteisRemoteDataSource extends Mock
    implements FetchMoteisRemoteDataSource {}

class _MockNetworkCheckerService extends Mock
    implements NetworkChekerServiceImpl {}

void main() {
  late FetchMoteisRemoteDataSource remoteDataSource;
  late NetworkCheckerService networkCheckerService;
  late FetchMoteisRepository repository;

  setUpAll(() {
    remoteDataSource = _MockFetchMoteisRemoteDataSource();

    networkCheckerService = _MockNetworkCheckerService();

    repository =
        FetchMoteisRepositoryImpl(remoteDataSource, networkCheckerService);
  });

  group("fetchMoteis repository tests", () {
    test(
        "Should return a ApiResponseEntity if the remote data source call succeed",
        () async {
      //Arrange
      when(() => networkCheckerService.isConnected)
          .thenAnswer((invocation) async => true);
      when(() => remoteDataSource.fetchMoteis())
          .thenAnswer((invocation) async => testApiResponseModel);

      //Act
      final result = await repository.fetchMoteis();

      //Assert
      expect(result, Right(testApiResponseModel));
      verify(() => remoteDataSource.fetchMoteis()).called(1);
    });

    test("Should return a Failure if the remote data source call fails",
        () async {
      //Arrange
      when(() => networkCheckerService.isConnected)
          .thenAnswer((invocation) async => true);
      when(() => remoteDataSource.fetchMoteis()).thenThrow(ServerFailure());

      //Act
      final result = await repository.fetchMoteis();

      //Assert
      expect(result, Left(ServerFailure()));
      verify(() => remoteDataSource.fetchMoteis()).called(1);
    });

    test("Should return a NoConnection Failure if there is no connection",
        () async {
      //Arrange
      when(() => networkCheckerService.isConnected)
          .thenAnswer((invocation) async => false);
      when(() => remoteDataSource.fetchMoteis())
          .thenAnswer((invocation) async => testApiResponseModel);

      //Act
      final result = await repository.fetchMoteis();

      //Assert
      expect(result, Left(NoConnectionFailure()));
      verifyNever(() => remoteDataSource.fetchMoteis());
    });
  });
}
