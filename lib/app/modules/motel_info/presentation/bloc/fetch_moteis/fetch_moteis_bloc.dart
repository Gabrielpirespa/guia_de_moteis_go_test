import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/api_response_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/usecases/fetch_moteis_use_case.dart';

part 'fetch_moteis_event.dart';
part 'fetch_moteis_state.dart';

class FetchMoteisBloc {
  FetchMoteisUseCase fetchMoteisUseCase;

  FetchMoteisBloc(this.fetchMoteisUseCase) {
    _inputController.stream.listen(_mapEventToState);
  }

  final StreamController<FetchMoteisEvent> _inputController =
      StreamController<FetchMoteisEvent>();

  final StreamController<FetchMoteisState> _outputController =
      StreamController<FetchMoteisState>();

  Sink<FetchMoteisEvent> get input => _inputController.sink;
  Stream<FetchMoteisState> get stream => _outputController.stream;

  void _mapEventToState(FetchMoteisEvent event) {
    _outputController.add(FetchMoteisLoadingState());

    if (event is MakeFetchMoteisEvent) {
      fetchMoteisUseCase.fetchMoteis().then((value) => value.fold(
          (failure) => _outputController
              .add(FetchMoteisErrorState(message: failure.message)),
          (success) => _outputController
              .add(FetchMoteisSuccessState(response: success))));
    }
  }
}
