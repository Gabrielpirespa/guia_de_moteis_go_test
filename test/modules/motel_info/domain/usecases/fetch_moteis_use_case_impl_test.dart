import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/repositories/fetch_moteis/fetch_moteis_repository.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_values/test_classes.dart';

class _MockFetchMoteisRepository extends Mock
    implements FetchMoteisRepository {}

void main() {
  late FetchMoteisRepository repository;
  late FetchMoteisUseCase useCase;

  setUpAll(() {
    repository = _MockFetchMoteisRepository();
    useCase = FetchMoteisUseCaseImpl(repository);
  });

  group('fetchMoteis useCase tests', () {
    test('Should return an ApiResponseEntity if the repository call succeed',
        () async {
      //Arrange
      when(() => repository.fetchMoteis())
          .thenAnswer((invocation) async => Right(testApiResponseEntity));

      //Act
      final result = await useCase.fetchMoteis();

      //Assert
      expect(result, Right(testApiResponseEntity));
    });

    test('Should return an ServerFailure if the repository call fails',
        () async {
      //Arrange
      when(() => repository.fetchMoteis())
          .thenAnswer((invocation) async => Left(ServerFailure()));

      //Act
      final result = await useCase.fetchMoteis();

      //Assert
      expect(result, Left(ServerFailure()));
    });

    test('Should return an NoConnectionFailure if there is no connection',
        () async {
      //Arrange
      when(() => repository.fetchMoteis())
          .thenAnswer((invocation) async => Left(NoConnectionFailure()));

      //Act
      final result = await useCase.fetchMoteis();

      //Assert
      expect(result, Left(NoConnectionFailure()));
    });
  });
}
