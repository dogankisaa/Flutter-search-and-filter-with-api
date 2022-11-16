import 'package:flutter/cupertino.dart';
import 'package:flutter_study_case/core/service/get_exercises.dart';
import 'package:flutter_study_case/model/exercise_model.dart';

import 'package:flutter_study_case/view_model/base_view_model.dart';

class ExercisesViewModel extends BaseViewModel {
  List denemee = [];
  List name = [];
  List type = [];
  List filteredName = [];
  List filteredType = [];

  TextEditingController searchInputController = TextEditingController();

  @override
  List exercises = [];
  Future<void> init() async {
    fetchExercise();
  }

  searchExercise() {
    print(filteredName);
    searchInputController.text.split(" ").forEach((word) {
      filteredName.addAll(name.where((element) => element.contains(word)));
      filteredName = filteredName.toSet().toList();
    });
    print(filteredName);
    searchInputController.text.length == 0 ?? filteredName.clear();
    notifyListeners();
  }

  Future fetchExercise() async {
    denemee = await GetExercises().getExercises();
    for (int i = 0; i < denemee.length; i++) {
      name.add(denemee[i]["name"]);
      type.add(denemee[i]["type"]);
    }
    notifyListeners();

    return denemee[0]["name"];
  }
}
