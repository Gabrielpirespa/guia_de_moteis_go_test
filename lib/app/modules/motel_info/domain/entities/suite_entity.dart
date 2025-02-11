import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/categoria_itens_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/itens_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/periodos_entity.dart';

class SuiteEntity extends Equatable {
  final String? nome;
  final int? qtd;
  final bool? exibirQtdDisponiveis;
  final List<String>? fotos;
  final List<ItensEntity>? itens;
  final List<CategoriaItensEntity>? categoriaItens;
  final List<PeriodosEntity>? periodos;

  const SuiteEntity({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  @override
  List<Object?> get props =>
      [nome, qtd, exibirQtdDisponiveis, fotos, itens, categoriaItens, periodos];

  @override
  bool get stringify => true;
}
