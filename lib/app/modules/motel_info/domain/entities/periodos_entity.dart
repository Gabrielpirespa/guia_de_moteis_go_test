import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/discount_entity.dart';

class PeriodosEntity extends Equatable {
  final String? tempoFormatado;
  final String? tempo;
  final double? valor;
  final double? valorTotal;
  final bool? temCortesia;
  final DiscountEntity? desconto;

  const PeriodosEntity(
      {this.tempoFormatado,
      this.tempo,
      this.valor,
      this.valorTotal,
      this.temCortesia,
      this.desconto});

  @override
  List<Object?> get props =>
      [tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto];

  @override
  bool get stringify => true;
}
