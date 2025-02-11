import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/api_response_model.dart';

abstract class FetchMoteisRemoteDataSource {
  Future<ApiResponseModel> fetchMoteis();
}
