import 'package:equatable/equatable.dart';

class ItensEntity extends Equatable {
  final String? nome;

  const ItensEntity({this.nome});

  @override
  List<Object?> get props => [nome];

  @override
  bool get stringify => true;
}
