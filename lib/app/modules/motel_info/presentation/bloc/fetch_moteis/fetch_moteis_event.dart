part of 'fetch_moteis_bloc.dart';

abstract class FetchMoteisEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MakeFetchMoteisEvent extends FetchMoteisEvent {}
