import 'package:get_it/get_it.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/loader/loader_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/numbers/numbers_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/services/services_bloc.dart';

final GetIt locator = GetIt.instance;

void setUp(){
  locator.registerSingleton<ServicesBloc>(ServicesBloc());
  locator.registerSingleton<NumbersBloc>(NumbersBloc());
  locator.registerSingleton(LoaderBloc());
}