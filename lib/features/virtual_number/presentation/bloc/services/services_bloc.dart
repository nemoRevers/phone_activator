import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:phone_activator/core/locator.dart';
import 'package:phone_activator/features/virtual_number/data/models/auth_model.dart';
import 'package:phone_activator/features/virtual_number/domain/usecases/buy_number_usecase.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/loader/loader_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/numbers/numbers_bloc.dart';

import '../../../data/models/buy_model.dart';
import '../../../data/models/service_model.dart';
import '../../../data/models/translates_model.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  static const BuyNumberUseCase _buyNumberUseCase = BuyNumberUseCase();
  AuthModel? authModel;
  ServicesBloc() : super(const ServicesInitial()) {
    on<ServicesLoadedEvent>((event, emit) {
      authModel = event.authModel;
      emit(ServicesLoaded(event.services, event.translatesModel, event.authModel));
    });
    on<ServicesBuyEvent>((event,emit)async{
      try {
        print('object');
        emit(const ProcessOfBuying());
        final BuyModel buyModel = await _buyNumberUseCase.buy(
            authModel!.refreshToken, authModel!.sessionId, event.shortName);
        locator.get<NumbersBloc>().add(AddNumberEvent(buyModel));
        emit(const ServiceBought());
      } catch(e){
        emit(const ServiceBoughtError('Нет номеров'));
      }
    });
  }
}
