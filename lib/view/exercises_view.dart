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
            body: exerciseListCard(viewModel));
      },
    );
  }

  Padding exerciseListCard(ExercisesViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Consumer<ExercisesViewModel>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: GetExercises().getExercises(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        viewModel.filteredName.isNotEmpty
                            ? viewModel.filteredName.length.toString() +
                                " results found."
                            : viewModel.name.length.toString() +
                                " results found.",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Column(
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
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          viewModel.filteredName.isNotEmpty
                                              ? viewModel.filteredName[index]
                                              : viewModel.name[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(color: Colors.grey),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              viewModel.filteredType.isNotEmpty
                                                  ? viewModel
                                                      .filteredType[index]
                                                      .toString()
                                                  : viewModel.type[index]
                                                      .toString(),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          viewModel.filteredMuscle.isNotEmpty
                                              ? viewModel.filteredMuscle[index]
                                              : viewModel.muscle[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
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
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
