import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/themes/app_theme.dart';

class FiltersContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  const FiltersContainer({required this.text, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        border: Border.all(color: AppTheme.colors.lightGray),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6,
        ),
        child: Row(
          children: [
            Visibility(
              visible: icon != null,
              child: Icon(
                icon ?? Icons.tune,
                size: 19,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
