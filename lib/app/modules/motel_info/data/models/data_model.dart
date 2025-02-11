import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/motel_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/data_entity.dart';

class DataModel extends DataEntity {
  const DataModel(
      {super.pagina,
      super.qtdPorPagina,
      super.totalSuites,
      super.totalMoteis,
      super.raio,
      super.maxPaginas,
      super.moteis});

  factory DataModel.fromEntity(DataEntity dataEntity) => DataModel(
        pagina: dataEntity.pagina,
        qtdPorPagina: dataEntity.qtdPorPagina,
        totalSuites: dataEntity.totalSuites,
        totalMoteis: dataEntity.totalMoteis,
        raio: dataEntity.raio,
        maxPaginas: dataEntity.maxPaginas,
        moteis: dataEntity.moteis,
      );

  factory DataModel.fromMap(Map<String, dynamic> map) => DataModel(
      pagina: map["pagina"],
      qtdPorPagina: map["qtdPorPagina"],
      totalSuites: map["totalSuites"],
      totalMoteis: map["totalMoteis"],
      raio: map["raio"],
      maxPaginas: map["maxPaginas"],
      moteis:
          (map["moteis"] as List).map((i) => MotelModel.fromMap(i)).toList());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
