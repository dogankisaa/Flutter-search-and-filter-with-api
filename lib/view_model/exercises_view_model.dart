import 'package:flutter/cupertino.dart';
import 'package:flutter_study_case/core/service/get_exercises.dart';
import 'package:flutter_study_case/core/service/get_filtered_exercises.dart';

import 'package:flutter_study_case/view_model/base_view_model.dart';

class ExercisesViewModel extends BaseViewModel {
  List exerciseList = [];
  List name = [];
  List type = [];
  List muscle = [];
  List filteredExerciseList = [];
  List filteredName = [];
  List filteredType = [];
  List filteredMuscle = [];
  bool filterMuscleOption = false;
  bool filterTypeOption = false;

  TextEditingController searchInputController = TextEditingController();
  List<String> filterDropdownMuscle = <String>[
    "abdominals",
    "adductors",
    "biceps",
    "calves",
    "chest",
    "forearms",
    "glutes",
    "hamstrings",
    "lats",
    "lowerback",
    "middleback",
    "neck",
    "quadriceps"
        "traps",
    "triceps"
  ];
  List<String> filterDropdownType = <String>[
    "cardio",
    "olympic_weightlifting",
    "plyometrics",
    "powerlifting",
    "strength",
    "stretching",
    "strongman",
  ];

  @override
  Future<void> init() async {
    fetchExercise();
  }

  searchExercise() async {
    clearFilteredLists();

    searchInputController.text.split(" ").forEach((word) {
      filteredName.addAll(name.where((element) => element.contains(word)));
      filteredName = filteredName.toSet().toList();
      for (int i = 0; i < name.length; i++) {
        if (name[i].contains(word)) {
          filteredMuscle.add(muscle[i]);
          filteredType.add(type[i]);
        }
      }
    });

    searchInputController.text.isNotEmpty ?? filteredName.clear();
    notifyListeners();
  }

  Future fetchExercise() async {
    exerciseList = await GetExercises().getExercises();
    for (int i = 0; i < exerciseList.length; i++) {
      name.add(exerciseList[i]["name"]);
      type.add(exerciseList[i]["type"]);
      muscle.add(exerciseList[i]["muscle"]);
    }

    notifyListeners();
  }

  changeFilterStatus(String type, BuildContext context, String detail) async {
    clearFilteredLists();
    filteredExerciseList =
        await GetFilteredExercises().getFilteredExercises(type, detail);

    for (int i = 0; i < filteredExerciseList.length; i++) {
      filteredName.add(filteredExerciseList[i]["name"]);
      filteredType.add(filteredExerciseList[i]["type"]);
      filteredMuscle.add(filteredExerciseList[i]["muscle"]);
    }
    Navigator.pop(context);
    searchInputController.clear();
    notifyListeners();
  }

  clearFilteredLists() {
    filteredMuscle.clear();
    filteredName.clear();
    filteredType.clear();
    notifyListeners();
  }
}
