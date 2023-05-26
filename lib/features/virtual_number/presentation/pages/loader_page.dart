import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/loader/loader_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/components/my_activity_indicaor.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LoaderBloc>().add(const InitLoader());
    return BlocListener<LoaderBloc, LoaderState>(
      listenWhen: (prev, current) => current is LoaderLoaded,
      listener: (context, state){
        GoRouter.of(context).go('/');
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: MyActivityIndicator()
        ),
      ),
    );
  }
}
