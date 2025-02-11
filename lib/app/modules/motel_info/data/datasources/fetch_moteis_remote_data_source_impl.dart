import 'dart:convert';

import 'package:guia_de_moteis_application/app/core/services/rest_client/rest_client_service.dart';
import 'package:guia_de_moteis_application/app/core/utils/apis/apis.dart';
import 'package:guia_de_moteis_application/app/core/utils/errors/failures.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/api_response_model.dart';

class FetchMoteisRemoteDataSourceImpl implements FetchMoteisRemoteDataSource {
  final RestClientService _client;

  FetchMoteisRemoteDataSourceImpl(this._client);
  @override
  Future<ApiResponseModel> fetchMoteis() async {
    try {
      final response = await _client.get(url: Apis.getMotelEndpoint);

      if (response.statusCode == 200) {
        return ApiResponseModel.fromJson(utf8.decode(response.bodyBytes));
      }
      throw ServerFailure();
    } catch (error) {
      throw ServerFailure();
    }
  }
}
