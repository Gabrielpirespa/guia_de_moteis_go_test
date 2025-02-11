import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/discount_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/periodos_entity.dart';

class PeriodosModel extends PeriodosEntity {
  const PeriodosModel(
      {super.tempoFormatado,
      super.tempo,
      super.valor,
      super.valorTotal,
      super.temCortesia,
      super.desconto});

  factory PeriodosModel.fromEntity(PeriodosEntity periodosEntity) =>
      PeriodosModel(
        tempoFormatado: periodosEntity.tempoFormatado,
        tempo: periodosEntity.tempo,
        valor: periodosEntity.valor,
        valorTotal: periodosEntity.valorTotal,
        temCortesia: periodosEntity.temCortesia,
        desconto: periodosEntity.desconto,
      );

  factory PeriodosModel.fromMap(Map<String, dynamic> map) => PeriodosModel(
        tempoFormatado: map["tempoFormatado"],
        tempo: map["tempo"],
        valor: map["valor"],
        valorTotal: map["valorTotal"],
        temCortesia: map["temCortesia"],
        desconto: map["desconto"] != null
            ? DiscountModel.fromMap(map["desconto"])
            : null,
      );

  factory PeriodosModel.fromJson(String source) =>
      PeriodosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
