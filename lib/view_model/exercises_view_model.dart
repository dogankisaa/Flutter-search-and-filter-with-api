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
  String typeFilterDropdownValue = "Choose";
  String muscleFilterDropDownValue = "Choose a Muscle";
  @override
  List exercises = [];
  Future<void> init() async {
    fetchExercise();
  }

  searchExercise() async {
    print(filteredName);
    searchInputController.text.split(" ").forEach((word) {
      filteredName.addAll(name.where((element) => element.contains(word)));
      filteredName = filteredName.toSet().toList();
    });

    searchInputController.text.length == 0 ?? filteredName.clear();
    notifyListeners();
  }

  Future fetchExercise() async {
    exerciseList = await GetExercises().getExercises();
    for (int i = 0; i < exerciseList.length; i++) {
      name.add(exerciseList[i]["name"]);
      type.add(exerciseList[i]["type"]);
    }

    notifyListeners();
  }

  changeFilterStatus(String type, BuildContext context, String detail) async {
    filteredExerciseList =
        await GetFilteredExercises().getFilteredExercises(type, detail);
    print(filteredExerciseList);
    for (int i = 0; i < filteredExerciseList.length; i++) {
      filteredName.add(filteredExerciseList[i]["name"]);
      filteredType.add(filteredExerciseList[i]["type"]);
    }
    Navigator.pop(context);
    notifyListeners();
  }

  setFilterDropDownValue(String type, String value) {
    print(typeFilterDropdownValue);
    type == "type"
        ? typeFilterDropdownValue = value
        : muscleFilterDropDownValue = value;
    print(typeFilterDropdownValue);
    notifyListeners();
  }
}
