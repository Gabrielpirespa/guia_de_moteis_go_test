import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/suite_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/suite_item.dart';

class SuiteCarousel extends StatefulWidget {
  final List<SuiteEntity>? suites;
  const SuiteCarousel({super.key, required this.suites});

  @override
  State<SuiteCarousel> createState() => _SuiteCarouselState();
}

class _SuiteCarouselState extends State<SuiteCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: false,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height * 0.8,
      ),
      itemCount: widget.suites?.length,
      itemBuilder: (context, index, realIndex) {
        return SuiteItem(
          suite: widget.suites?[index],
        );
      },
    );
  }
}
