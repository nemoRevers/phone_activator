part of 'loader_bloc.dart';

@immutable
abstract class LoaderEvent {}

class InitLoader implements LoaderEvent {
  const InitLoader();
}
