import 'package:equatable/equatable.dart';

class DiscountEntity extends Equatable {
  final double? desconto;

  const DiscountEntity({this.desconto});

  @override
  List<Object?> get props => [desconto];
}
