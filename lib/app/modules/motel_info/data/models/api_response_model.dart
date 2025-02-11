import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/data_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/api_response_entity.dart';

class ApiResponseModel extends ApiResponseEntity {
  const ApiResponseModel({super.sucesso, super.data, super.mensagem});

  factory ApiResponseModel.fromEntity(ApiResponseEntity apiResponseEntity) =>
      ApiResponseModel(
        sucesso: apiResponseEntity.sucesso,
        data: apiResponseEntity.data,
        mensagem: apiResponseEntity.mensagem,
      );

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) =>
      ApiResponseModel(
        sucesso: map["sucesso"],
        data: DataModel.fromMap(map["data"]),
        mensagem: List<String>.from(map["mensagem"] ?? []),
      );

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
