import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/data_entity.dart';

class ApiResponseEntity extends Equatable {
  final bool? sucesso;
  final DataEntity? data;
  final List<String>? mensagem;

  const ApiResponseEntity({this.sucesso, this.data, this.mensagem});

  @override
  List<Object?> get props => [sucesso, data, mensagem];

  @override
  bool get stringify => true;
}
