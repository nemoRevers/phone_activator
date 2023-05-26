import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_activator/core/locator.dart';
import 'package:phone_activator/features/virtual_number/presentation/components/my_activity_indicaor.dart';
import 'package:phone_activator/features/virtual_number/presentation/components/service_card.dart';

import '../bloc/services/services_bloc.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServicesBloc servicesBloc = locator.get<ServicesBloc>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Builder(builder: (context) {
        return BlocConsumer<ServicesBloc, ServicesState>(
          listener: (prev, current) {
            if (current is ServiceBought) {
              GoRouter.of(context).pushNamed('numbers');
            } else if (current is ServiceBoughtError) {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    current.error,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              );
            }
          },
          listenWhen: (prev, current) =>
              current is ServiceBought || current is ServiceBoughtError,
          buildWhen: (prev, current) => current is ServicesLoaded,
          builder: (BuildContext context, ServicesState state) {
            if (state is ServicesLoaded) {
              return CustomScrollView(
                primary: true,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    leadingWidth: 200,
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    // leading: Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 10),
                    //     child: FittedBox(
                    //       fit: BoxFit.scaleDown,
                    //       child: DecoratedBox(
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(
                    //               CupertinoThumbPainter.radius),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Center(
                    //             child: RichText(
                    //               text: TextSpan(
                    //                 children: [
                    //                   TextSpan(
                    //                     text: '\$ ',
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .headlineMedium
                    //                         ?.copyWith(
                    //                           color: Colors.green,
                    //                         ),
                    //                   ),
                    //                   TextSpan(
                    //                     text: state.authModel.balance,
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .headlineMedium,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    actions: [
                      FilledButton.tonalIcon(
                        onPressed: () {
                          GoRouter.of(context).pushNamed('numbers');
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        label: Text(
                          'Numbers',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      )
                    ],
                  ),
                  SliverPadding(
                    sliver: SliverList.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ServiceCard(
                          name: state
                              .translatesModel
                              .services['${state.services[index].shortName}_0']!
                              .en,
                          logo: Image.network(
                            'https://smsactivate.s3.eu-central-1.amazonaws.com/assets/ico/${state.services[index].shortName}0.webp',
                            height: 40,
                            errorBuilder: (BuildContext context, Object object,
                                    StackTrace? stack) =>
                                const SizedBox(),
                          ),
                          totalCount:
                              state.services[index].totalCount.toString(),
                          price: state.services[index].minPrice.toString(),
                          onBuy: () {
                            servicesBloc.add(
                              ServicesBuyEvent(
                                state.services[index].shortName,
                              ),
                            );
                          },
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 10),
                      itemCount: state.services.length,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                  ),
                ],
              );
            } else {
              return const MyActivityIndicator();
            }
          },
        );
      }),
    );
  }
}
