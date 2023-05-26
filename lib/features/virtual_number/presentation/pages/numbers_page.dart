import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:phone_activator/core/locator.dart';
import 'package:phone_activator/features/virtual_number/presentation/components/my_activity_indicaor.dart';

import '../bloc/numbers/numbers_bloc.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumbersBloc, NumbersState>(
      builder: (context, state) {
        if (state is NumbersLoaded) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              itemBuilder: (BuildContext context, int index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: NumberTile(
                  state: state,
                  index: index,
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemCount: state.models.length,
            ),
          );
        } else {
          return const MyActivityIndicator();
        }
      },
    );
  }

  @override
  void dispose() {
    locator.get<NumbersBloc>().dispose();
    super.dispose();
  }
}

class NumberTile extends StatefulWidget {
  final NumbersLoaded state;
  final int index;
  const NumberTile({super.key, required this.state, required this.index});

  @override
  State<NumberTile> createState() => _NumberTileState();
}

class _NumberTileState extends State<NumberTile> {
  late final int minutes;
  late final String date;
  final DateFormat format = DateFormat('dd MMM yyyy');
  final int minute = 60;
  final NumbersBloc numbersBloc = locator.get<NumbersBloc>();

  @override
  void initState() {
    date = format.format(DateTime.fromMillisecondsSinceEpoch(
        widget.state.models[widget.index].timeStart * 1000));
    minutes = (widget.state.models[widget.index].timeEnd -
            DateTime.now().millisecondsSinceEpoch / 1000) ~/
        minute;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(
            widget.state.models[widget.index].phone,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            date.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: Text(
            minutes.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FilledButton(
            onPressed: () {
              numbersBloc.add(CancelNumberEvent(widget.index));
            },
            child: Text(
              'Отменить',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
