import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/loader/loader_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/numbers/numbers_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/bloc/services/services_bloc.dart';
import 'package:phone_activator/features/virtual_number/presentation/pages/numbers_page.dart';
import 'package:phone_activator/features/virtual_number/presentation/pages/services_page.dart';

import '../features/virtual_number/presentation/pages/loader_page.dart';
import 'locator.dart';

final GoRouter router = GoRouter(
  initialLocation: '/loader',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (_, __) => BlocProvider.value(
        value: locator.get<ServicesBloc>(),
        child: const ServicesPage(),
      ),
      routes: <GoRoute>[
        GoRoute(
          name: 'numbers',
          path: 'numbers',
          builder: (_, __) => BlocProvider.value(
            value: locator.get<NumbersBloc>(),
            child: const NumbersPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/loader',
      builder: (_, __) => BlocProvider<LoaderBloc>(
        create: (BuildContext context) => LoaderBloc(),
        child: const LoaderPage(),
      ),
    ),
  ],
);
