part of 'loader_bloc.dart';

@immutable
abstract class LoaderState {}

class LoaderInitial implements LoaderState {
  const LoaderInitial();
}

class LoaderLoaded implements LoaderState {
  final AuthModel authModel;
  const LoaderLoaded(this.authModel);
}
