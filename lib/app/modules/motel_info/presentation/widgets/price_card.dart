import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/themes/app_theme.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/periodos_entity.dart';

class PriceCard extends StatelessWidget {
  final PeriodosEntity? periodo;
  const PriceCard({super.key, required this.periodo});

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount = periodo?.desconto != null;

    return Card(
      color: AppTheme.colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      periodo?.tempoFormatado ?? "",
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Visibility(
                      visible: hasDiscount,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.colors.white,
                          border: Border.all(
                            color: AppTheme.colors.green,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${periodo?.desconto?.desconto?.toStringAsFixed(0)}% off",
                          style: TextStyle(
                            color: AppTheme.colors.green,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "R\$ ${periodo?.valor?.toStringAsFixed(2).replaceAll(".", ",")}",
                      style: TextStyle(
                        fontSize: 21,
                        color: hasDiscount
                            ? AppTheme.colors.gray2
                            : AppTheme.colors.black,
                        decoration:
                            hasDiscount ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Visibility(
                      visible: hasDiscount,
                      child: Text(
                        "R\$ ${periodo?.valorTotal?.toStringAsFixed(2).replaceAll(".", ",")}",
                        style: const TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              size: 34,
              color: AppTheme.colors.gray2,
            ),
          ],
        ),
      ),
    );
  }
}
