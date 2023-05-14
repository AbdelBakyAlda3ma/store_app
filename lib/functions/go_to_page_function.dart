import 'package:flutter/material.dart';

void goTo(
    {required BuildContext context,
    required String routeName,
    required Object arguments}) {
  Navigator.pushNamed(context, routeName, arguments: arguments);
}
