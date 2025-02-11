import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/categoria_itens_entity.dart';

class CategoriaItensModel extends CategoriaItensEntity {
  const CategoriaItensModel({super.nome, super.icone});

  factory CategoriaItensModel.fromEntity(
          CategoriaItensEntity categoriaItensEntity) =>
      CategoriaItensModel(
        nome: categoriaItensEntity.nome,
        icone: categoriaItensEntity.icone,
      );

  factory CategoriaItensModel.fromMap(Map<String, dynamic> map) =>
      CategoriaItensModel(
        nome: map["nome"],
        icone: map["icone"],
      );

  factory CategoriaItensModel.fromJson(String source) =>
      CategoriaItensModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
