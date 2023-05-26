import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/services/services_bloc.dart';
import 'my_activity_indicaor.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  final Widget? logo;
  final String totalCount;
  final String price;
  final Function()? onBuy;
  const ServiceCard(
      {Key? key,
      required this.name,
      this.logo,
      required this.totalCount,
      required this.price,
      this.onBuy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.secondary,
      shape: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              leading: logo,
              title: Text(
                name,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalCount,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$ ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.green,
                              ),
                        ),
                        TextSpan(
                          text: price,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FilledButton(
                onPressed: onBuy,
                child: Text(
                  'Buy',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const VerticalDivider(width: 20),
//
//               ],
//             ),
//           ],
//         ),
