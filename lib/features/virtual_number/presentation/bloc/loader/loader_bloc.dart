
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:phone_activator/core/locator.dart';
import 'package:phone_activator/features/virtual_number/data/models/auth_model.dart';
import 'package:phone_activator/features/virtual_number/data/models/service_model.dart';
import 'package:phone_activator/features/virtual_number/data/models/translates_model.dart';
import 'package:phone_activator/features/virtual_number/domain/usecases/auth_usecase.dart';
import 'package:phone_activator/features/virtual_number/domain/usecases/get_translates_usecase.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/numbers/numbers_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/services/services_bloc.dart';

import '../../../domain/usecases/get_services_usecase.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  final GetServicesUseCase _getServicesUseCase = const GetServicesUseCase();
  final GetTranslatesUseCase _getTranslatesUseCase = const GetTranslatesUseCase();
  final AuthUseCase _authUseCase = const AuthUseCase();
  final ServicesBloc _servicesBloc = locator.get<ServicesBloc>();

  LoaderBloc() : super(const LoaderInitial()) {
    on<InitLoader>((event, emit) async{
      final List<ServiceModel> services = await _getServicesUseCase.getServicesList();
      final TranslatesModel translates = await _getTranslatesUseCase.getTranslates();
      final AuthModel authModel = await _authUseCase.auth();
      locator.get<NumbersBloc>().add(const GetNumbersEvent());
      _servicesBloc.add(ServicesLoadedEvent(services, translates, authModel));
      emit(LoaderLoaded(authModel));
    });
  }
}
