import 'package:flutter/material.dart';

import '../widgets/exercises_view_widgets/filter_continer.dart';

Future<dynamic> bottomSheet(BuildContext context, model, Widget body) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => body,
  );
}
