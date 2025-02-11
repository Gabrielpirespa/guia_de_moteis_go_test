import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/bloc/fetch_moteis/fetch_moteis_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_values/test_classes.dart';

class _MockFetchMoteisUseCase extends Mock implements FetchMoteisUseCase {}

void main() {
  late FetchMoteisUseCase useCase;
  late FetchMoteisBloc bloc;

  setUp(() {
    useCase = _MockFetchMoteisUseCase();
    bloc = FetchMoteisBloc(useCase);
  });

  group('fetchMoteis bloc tests', () {
    test('Should emit loading and success state if the useCase call succeed',
        () {
      //Arrange
      when(() => useCase.fetchMoteis())
          .thenAnswer((invocation) async => Right(testApiResponseEntity));

      //Act
      bloc.input.add(MakeFetchMoteisEvent());

      //Assert
      expect(
          bloc.stream,
          emitsInOrder([
            FetchMoteisLoadingState(),
            FetchMoteisSuccessState(response: testApiResponseEntity),
          ]));
    });

    test('Should emit loading and error state if the useCase call fails', () {
      //Arrange
      when(() => useCase.fetchMoteis())
          .thenAnswer((invocation) async => Left(ServerFailure()));

      //Act
      bloc.input.add(MakeFetchMoteisEvent());

      //Assert
      expect(
          bloc.stream,
          emitsInOrder([
            FetchMoteisLoadingState(),
            FetchMoteisErrorState(message: ServerFailure().message),
          ]));
    });

    test('Should emit loading and error state if there is no connection', () {
      //Arrange
      when(() => useCase.fetchMoteis())
          .thenAnswer((invocation) async => Left(NoConnectionFailure()));

      //Act
      bloc.input.add(MakeFetchMoteisEvent());

      //Assert
      expect(
          bloc.stream,
          emitsInOrder([
            FetchMoteisLoadingState(),
            FetchMoteisErrorState(message: NoConnectionFailure().message),
          ]));
    });
  });
}
