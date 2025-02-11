import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/themes/app_theme.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/suite_carousel.dart';

class MotelCard extends StatefulWidget {
  final MotelEntity? motel;
  const MotelCard({super.key, required this.motel});

  @override
  State<MotelCard> createState() => _MotelCardState();
}

class _MotelCardState extends State<MotelCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.network(
                      widget.motel?.logo ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.motel?.fantasia?.toLowerCase() ?? "",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "${widget.motel?.distancia?.toStringAsFixed(1).replaceAll(".", ",")}km - ${widget.motel?.bairro?.toLowerCase()}",
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.favorite,
                  size: 28,
                  color: AppTheme.colors.gray,
                )
              ],
            ),
          ),
          SuiteCarousel(
            suites: widget.motel?.suites,
          ),
        ],
      ),
    );
  }
}
