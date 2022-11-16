import 'package:flutter_study_case/core/service/get_exercises.dart';
import 'package:flutter_study_case/model/exercise_model.dart';
import 'package:flutter_study_case/view_model/base_view_model.dart';

class ExercisesViewModel extends BaseViewModel {
  late Future exercises;
  @override
  Future<void> init() async {
    print("object");
    notifyListeners();
  }

  deneme() {
    print(exercises);
  }
}
