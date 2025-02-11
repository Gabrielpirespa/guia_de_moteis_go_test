import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/suite_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/motel_entity.dart';

class MotelModel extends MotelEntity {
  const MotelModel({
    super.fantasia,
    super.logo,
    super.bairro,
    super.distancia,
    super.qtdFavoritos,
    super.suites,
    super.qtdAvaliacoes,
    super.media,
  });

  factory MotelModel.fromEntity(MotelEntity motelEntity) => MotelModel(
        fantasia: motelEntity.fantasia,
        logo: motelEntity.logo,
        bairro: motelEntity.bairro,
        distancia: motelEntity.distancia,
        qtdFavoritos: motelEntity.qtdFavoritos,
        suites: motelEntity.suites,
        qtdAvaliacoes: motelEntity.qtdAvaliacoes,
        media: motelEntity.media,
      );

  factory MotelModel.fromMap(Map<String, dynamic> map) => MotelModel(
        fantasia: map["fantasia"],
        logo: map["logo"],
        bairro: map["bairro"],
        distancia: map["distancia"],
        qtdFavoritos: map["qtdFavoritos"],
        suites:
            (map['suites'] as List).map((i) => SuiteModel.fromMap(i)).toList(),
        qtdAvaliacoes: map["qtdAvaliacoes"],
        media: map["media"],
      );

  factory MotelModel.fromJson(String source) =>
      MotelModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
