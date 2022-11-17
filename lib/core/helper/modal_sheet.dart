import 'package:flutter/material.dart';

Future<dynamic> bottomSheet(BuildContext context, model, Widget body) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => body,
  );
}
