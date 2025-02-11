import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/themes/app_theme.dart';
import 'package:guia_de_moteis_application/app/container_injection.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/bloc/fetch_moteis/fetch_moteis_bloc.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/filters_container.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/filters_item_helper.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/loading_motels_skeleton.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/widgets/motel_card.dart';

class MotelInfoPage extends StatefulWidget {
  const MotelInfoPage({super.key});

  @override
  State<MotelInfoPage> createState() => _MotelInfoPageState();
}

class _MotelInfoPageState extends State<MotelInfoPage> {
  late FetchMoteisBloc _fetchMoteisBloc;

  @override
  void initState() {
    _fetchMoteisBloc = getIt<FetchMoteisBloc>();
    _fetchMoteisBloc.input.add(MakeFetchMoteisEvent());
    super.initState();
  }

  List<FiltersItemHelper> filtersList = [
    FiltersItemHelper(
      title: 'filtros',
      icon: Icons.tune,
    ),
    FiltersItemHelper(
      title: 'com desconto',
    ),
    FiltersItemHelper(
      title: 'disponíveis',
    ),
    FiltersItemHelper(
      title: 'hidro',
    ),
    FiltersItemHelper(
      title: 'piscina',
    ),
    FiltersItemHelper(
      title: 'sauna',
    ),
    FiltersItemHelper(
      title: 'ofurô',
    ),
    FiltersItemHelper(
      title: 'decoração erótica',
    ),
    FiltersItemHelper(
      title: 'decoração temática',
    ),
    FiltersItemHelper(
      title: 'cadeira erótica',
    ),
    FiltersItemHelper(
      title: 'pista de dança',
    ),
    FiltersItemHelper(
      title: 'garagem privativa',
    ),
    FiltersItemHelper(
      title: 'frigobar',
    ),
    FiltersItemHelper(
      title: 'internet wi-fi',
    ),
    FiltersItemHelper(
      title: 'suíte para festas',
    ),
    FiltersItemHelper(
      title: 'suíte com acessibilidade',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primaryColor,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.menu,
              color: AppTheme.colors.white,
            ),
            const SizedBox(
              width: 18,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppTheme.colors.darkRed,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 26),
                      child: Row(
                        children: [
                          Icon(
                            Icons.electric_bolt,
                            color: AppTheme.colors.primaryColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "ir agora",
                            style: TextStyle(
                                color: AppTheme.colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.colors.darkRed,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: AppTheme.colors.white,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "ir outro dia",
                            style: TextStyle(
                                color: AppTheme.colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Icon(
              Icons.search,
              color: AppTheme.colors.white,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'minha localização',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.colors.white,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppTheme.colors.backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        ...List.generate(filtersList.length, (index) {
                          FiltersItemHelper item = filtersList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 4),
                            child: FiltersContainer(
                              text: item.title,
                              icon: item.icon,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.321,
                  child: StreamBuilder(
                    stream: _fetchMoteisBloc.stream,
                    builder: (context, snapshot) {
                      FetchMoteisState? state = snapshot.data;

                      if (state is FetchMoteisLoadingState) {
                        return const LoadingMotelsSkeleton();
                      }

                      if (state is FetchMoteisSuccessState) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.response.data?.moteis?.length,
                            itemBuilder: (context, index) {
                              return MotelCard(
                                  motel: state.response.data?.moteis?[index]);
                            });
                      }

                      if (state is FetchMoteisErrorState) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      return const Center(
                        child: Text('Ocorreu um erro inesperado'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
