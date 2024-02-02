import 'package:flutter/material.dart';
import 'package:layout_utils/src/controllers/size_controller.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints, double padding) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, constraints, SizeController.getSize(constraints.maxWidth).width);
      },
    );
  }
}
