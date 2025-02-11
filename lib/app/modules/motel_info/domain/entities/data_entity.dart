import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/motel_entity.dart';

class DataEntity extends Equatable {
  final int? pagina;
  final int? qtdPorPagina;
  final int? totalSuites;
  final int? totalMoteis;
  final int? raio;
  final double? maxPaginas;
  final List<MotelEntity>? moteis;

  const DataEntity(
      {this.pagina,
      this.qtdPorPagina,
      this.totalSuites,
      this.totalMoteis,
      this.raio,
      this.maxPaginas,
      this.moteis});

  @override
  List<Object?> get props => [
        pagina,
        qtdPorPagina,
        totalSuites,
        totalMoteis,
        raio,
        maxPaginas,
        moteis
      ];

  @override
  bool get stringify => true;
}
