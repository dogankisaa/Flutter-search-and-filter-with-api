import 'package:flutter/material.dart';
import 'package:flutter_study_case/core/service/get_exercises.dart';
import 'package:flutter_study_case/view_model/exercises_view_model.dart';
import 'package:provider/provider.dart';

import '../core/widgets/exercises_view_widgets/custom_search_app_bar.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    late ExercisesViewModel viewModel;
    return ChangeNotifierProvider.value(
      value: viewModel = ExercisesViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: CustomSearchAppBar(
            viewModel: viewModel,
          ),
          body: IconButton(
            onPressed: () => GetExercises().getExercises(),
            icon: Icon(Icons.abc),
          ),
        );
      },
    );
  }
}
