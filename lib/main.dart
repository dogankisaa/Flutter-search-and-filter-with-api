import 'package:flutter/material.dart';
import 'package:flutter_study_case/core/theme/theme_data.dart';
import 'package:flutter_study_case/view/exercises_view.dart';
import 'package:flutter_study_case/view_model/exercises_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ExercisesViewModel>(
      create: (context) => ExercisesViewModel(),
      builder: (context, child) => const MyApp(),
    )
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      home: ExercisesView(),
    );
  }
}
