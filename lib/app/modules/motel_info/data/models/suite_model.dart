import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/categoria_itens_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/itens_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/periodos_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/suite_entity.dart';

class SuiteModel extends SuiteEntity {
  const SuiteModel({
    super.nome,
    super.qtd,
    super.exibirQtdDisponiveis,
    super.fotos,
    super.itens,
    super.categoriaItens,
    super.periodos,
  });

  factory SuiteModel.fromEntity(SuiteEntity suiteEntity) => SuiteModel(
        nome: suiteEntity.nome,
        qtd: suiteEntity.qtd,
        exibirQtdDisponiveis: suiteEntity.exibirQtdDisponiveis,
        fotos: suiteEntity.fotos,
        itens: suiteEntity.itens,
        categoriaItens: suiteEntity.categoriaItens,
        periodos: suiteEntity.periodos,
      );

  factory SuiteModel.fromMap(Map<String, dynamic> map) => SuiteModel(
        nome: map["nome"],
        qtd: map["qtd"],
        exibirQtdDisponiveis: map["exibirQtdDisponiveis"],
        fotos: List<String>.from(map["fotos"]),
        itens:
            (map["itens"] as List).map((i) => ItensModel.fromMap(i)).toList(),
        categoriaItens: (map["categoriaItens"] as List)
            .map((i) => CategoriaItensModel.fromMap(i))
            .toList(),
        periodos: (map["periodos"] as List)
            .map((i) => PeriodosModel.fromMap(i))
            .toList(),
      );

  factory SuiteModel.fromJson(String source) =>
      SuiteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
