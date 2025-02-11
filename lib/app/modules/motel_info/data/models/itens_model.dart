import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/itens_entity.dart';

class ItensModel extends ItensEntity {
  const ItensModel({super.nome});

  factory ItensModel.fromEntity(ItensEntity itensEntity) => ItensModel(
        nome: itensEntity.nome,
      );

  factory ItensModel.fromMap(Map<String, dynamic> map) => ItensModel(
        nome: map["nome"],
      );

  factory ItensModel.fromJson(String source) =>
      ItensModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
