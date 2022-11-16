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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Consumer<ExercisesViewModel>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          viewModel.filteredName.length != 0
                              ? viewModel.filteredName.length
                              : viewModel.name.length, (index) {
                        return Consumer<ExercisesViewModel>(
                          builder: (context, value, child) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        viewModel.filteredName.length != 0
                                            ? viewModel.filteredName[index]
                                            : viewModel.name[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
