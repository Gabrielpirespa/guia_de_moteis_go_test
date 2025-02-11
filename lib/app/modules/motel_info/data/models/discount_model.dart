import 'dart:convert';

import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/discount_entity.dart';

class DiscountModel extends DiscountEntity {
  const DiscountModel({super.desconto});

  factory DiscountModel.fromEntity(DiscountEntity discountEntity) =>
      DiscountModel(
        desconto: discountEntity.desconto,
      );

  factory DiscountModel.fromMap(Map<String, dynamic> map) => DiscountModel(
        desconto: map["desconto"],
      );

  factory DiscountModel.fromJson(String source) =>
      DiscountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
