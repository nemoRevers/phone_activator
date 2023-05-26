part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial implements ServicesState {
  const ServicesInitial();
}

class ServicesLoaded implements ServicesState{
  final List<ServiceModel> services;
  final TranslatesModel translatesModel;
  final AuthModel authModel;
  const ServicesLoaded(this.services, this.translatesModel, this.authModel);
}

class ServiceBoughtError implements ServicesState{
  final String error;
  const ServiceBoughtError(this.error);
}

class ServiceBought implements ServicesState{
  const ServiceBought();
}

class ProcessOfBuying implements ServicesState{
  const ProcessOfBuying();
}
