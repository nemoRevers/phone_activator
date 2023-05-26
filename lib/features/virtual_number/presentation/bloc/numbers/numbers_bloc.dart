
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:phone_activator/features/virtual_number/data/models/buy_model.dart';
import 'package:phone_activator/features/virtual_number/data/repositories/cancel_activation_impl.dart';
import 'package:phone_activator/features/virtual_number/data/repositories/numbers_impl.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/cancel_activation_repository.dart';

import '../../../domain/repositories/numbers_repository.dart';

part 'numbers_event.dart';
part 'numbers_state.dart';

class NumbersBloc extends Bloc<NumbersEvent, NumbersState> {
  final NumbersRepository _numbersRepository = const NumbersImpl();
  final CancelActivationRepository _cancelActivationRepository =
      CancelActivationImpl();
  List<BuyModel> models = [];
  NumbersBloc() : super(const NumbersInitial()) {
    on<GetNumbersEvent>((event, emit) async {
      models = await _numbersRepository.getNumbers();
      emit(NumbersLoaded(models));
    });
    on<AddNumberEvent>((event, emit) {
      _numbersRepository.addNumber(event.buyModel);
      models.add(event.buyModel);
      emit(NumbersLoaded(models));
    });
    on<CancelNumberEvent>((event, emit) async {
      models.removeAt(event.index);
      await _cancelActivationRepository.cancelActivation();
      _numbersRepository.removeNumber(event.index);
      emit(NumbersLoaded(models));
    });
  }
}
