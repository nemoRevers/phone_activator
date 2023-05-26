part of 'services_bloc.dart';

@immutable
abstract class ServicesEvent {}

class ServicesLoadedEvent implements ServicesEvent{
  final List<ServiceModel> services;
  final TranslatesModel translatesModel;
  final AuthModel authModel;
  const ServicesLoadedEvent(this.services, this.translatesModel, this.authModel);
}

class ServicesBuyEvent implements ServicesEvent{
  final String shortName;
  const ServicesBuyEvent(this.shortName);
}

