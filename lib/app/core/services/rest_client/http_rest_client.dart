import 'package:http/http.dart' as http;

import 'package:guia_de_moteis_application/app/core/services/rest_client/rest_client_service.dart';

class HttpRestClient implements RestClientService {
  final _client = http.Client();

  http.Client get clientHttp => _client;

  Type get responseHttp => http.Response;

  @override
  Future get({required String url}) async {
    return await _client.get(Uri.parse(url));
  }
}
