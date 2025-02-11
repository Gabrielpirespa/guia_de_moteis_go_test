part of 'fetch_moteis_bloc.dart';

abstract class FetchMoteisState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMoteisInitialState extends FetchMoteisState {}

class FetchMoteisLoadingState extends FetchMoteisState {}

class FetchMoteisErrorState extends FetchMoteisState {
  final String message;

  FetchMoteisErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FetchMoteisSuccessState extends FetchMoteisState {
  final ApiResponseEntity response;

  FetchMoteisSuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}
