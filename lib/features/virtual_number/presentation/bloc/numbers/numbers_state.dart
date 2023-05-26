part of 'numbers_bloc.dart';

@immutable
abstract class NumbersState {}

class NumbersInitial implements NumbersState {
  const NumbersInitial();
}

class NumbersLoaded implements NumbersState{
  final List<BuyModel> models;
  const NumbersLoaded(this.models);
}
