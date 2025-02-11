import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/themes/app_theme.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/suite_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/price_card.dart';

class SuiteItem extends StatefulWidget {
  final SuiteEntity? suite;
  const SuiteItem({required this.suite, super.key});

  @override
  State<SuiteItem> createState() => _SuiteItemState();
}

class _SuiteItemState extends State<SuiteItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppTheme.colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(widget.suite?.fotos?.first ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    widget.suite?.nome?.toLowerCase() ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppTheme.colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.suite?.categoriaItens?.length != null &&
                              widget.suite!.categoriaItens!.length >= 5
                          ? 5
                          : widget.suite?.categoriaItens?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppTheme.colors.lightGray2,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.network(
                              widget.suite?.categoriaItens?[index].icone ?? "",
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'ver \ntodos',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppTheme.colors.gray2,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppTheme.colors.gray2,
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.suite?.periodos?.length,
            itemBuilder: (context, index) {
              return PriceCard(periodo: widget.suite?.periodos?[index]);
            })
      ],
    );
  }
}
