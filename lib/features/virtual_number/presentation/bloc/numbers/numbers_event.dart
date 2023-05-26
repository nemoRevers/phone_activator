part of 'numbers_bloc.dart';

@immutable
abstract class NumbersEvent {}

class AddNumberEvent implements NumbersEvent{
  final BuyModel buyModel;
  const AddNumberEvent(this.buyModel);
}

class GetNumbersEvent implements NumbersEvent{
  const GetNumbersEvent();
}

class CancelNumberEvent implements NumbersEvent{
  final int index;
  const CancelNumberEvent(this.index);
}
