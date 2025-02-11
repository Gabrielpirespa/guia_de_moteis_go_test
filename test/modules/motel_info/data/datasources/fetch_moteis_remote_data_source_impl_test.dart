import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_application/app/config/app_initialization/app_initialization.dart';
import 'package:guia_de_moteis_application/app/core/services/rest_client/rest_client_service.dart';
import 'package:guia_de_moteis_application/app/core/utils/apis/apis.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source_impl.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/api_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../test_values/fixtures.dart';
import '../../../../test_values/test_classes.dart';

class _MockRestClientService extends Mock implements RestClientService {}

void main() {
  late RestClientService restClient;
  late FetchMoteisRemoteDataSource remoteDataSource;

  setUpAll(() {
    restClient = _MockRestClientService();
    remoteDataSource = FetchMoteisRemoteDataSourceImpl(restClient);
    AppInitialization.initAppConfigurations();
  });

  group('fetchMoteis remoteDataSource tests', () {
    test("Should return a ApiResponseModel if the api call succeed", () async {
      //Arrange
      http.Response testResponseSuccesJson =
          http.Response.bytes(utf8.encode(fixtures("api_response.json")), 200);
      when(
        () => restClient.get(url: Apis.getMotelEndpoint),
      ).thenAnswer((ivocation) async => testResponseSuccesJson);

      //Act
      final result = await remoteDataSource.fetchMoteis();

      //Assert
      expect(result, isA<ApiResponseModel>());
      expect(result, testApiResponseModel);
      verify(
        () => restClient.get(url: Apis.getMotelEndpoint),
      ).called(1);
    });

    test("Should return a ServerFailure if the api call fails", () async {
      http.Response testResponseErrorJson =
          http.Response.bytes(utf8.encode(fixtures("api_response.json")), 500);
      when(
        () => restClient.get(url: Apis.getMotelEndpoint),
      ).thenAnswer((ivocation) async => testResponseErrorJson);

      //Act
      final result = remoteDataSource.fetchMoteis();

      //Assert
      expect(result, throwsA(isA<ServerFailure>()));
      verify(
        () => restClient.get(url: Apis.getMotelEndpoint),
      ).called(1);
    });
  });
}
