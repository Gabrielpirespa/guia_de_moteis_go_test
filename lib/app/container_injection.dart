import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis_application/app/core/services/network_checker/network_checker_service.dart';
import 'package:guia_de_moteis_application/app/core/services/network_checker/network_cheker_service_impl.dart';
import 'package:guia_de_moteis_application/app/core/services/rest_client/http_rest_client.dart';
import 'package:guia_de_moteis_application/app/core/services/rest_client/rest_client_service.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/datasources/fetch_moteis_remote_data_source_impl.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/repositories/fetch_moteis_repository_impl.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/repositories/fetch_moteis/fetch_moteis_repository.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case_impl.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/bloc/fetch_moteis/fetch_moteis_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpContainer() async {
  getIt.registerLazySingleton<RestClientService>(() => HttpRestClient());
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.instance);

  getIt.registerLazySingleton<NetworkCheckerService>(
      () => NetworkChekerServiceImpl(getIt()));

  fetchMoteisFeature();
}

void fetchMoteisFeature() {
  getIt.registerLazySingleton<FetchMoteisRemoteDataSource>(
      () => FetchMoteisRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<FetchMoteisRepository>(
      () => FetchMoteisRepositoryImpl(getIt(), getIt()));

  getIt.registerLazySingleton<FetchMoteisUseCase>(
      () => FetchMoteisUseCaseImpl(getIt()));

  getIt.registerFactory(() => FetchMoteisBloc(getIt()));
}
