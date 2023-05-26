import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyActivityIndicator extends StatelessWidget {
  final Color? color;
  final double? radius;
  const MyActivityIndicator({Key? key, this.color, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius:radius ??23,
      color: color ?? Theme
          .of(context)
          .colorScheme
          .primary,
    );
  }
}
