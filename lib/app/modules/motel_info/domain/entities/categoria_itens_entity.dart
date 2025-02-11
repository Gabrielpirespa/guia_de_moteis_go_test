import 'package:equatable/equatable.dart';

class CategoriaItensEntity extends Equatable {
  final String? nome;
  final String? icone;

  const CategoriaItensEntity({this.nome, this.icone});

  @override
  List<Object?> get props => [nome, icone];

  @override
  bool get stringify => true;
}
