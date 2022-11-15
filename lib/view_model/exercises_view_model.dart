import 'package:flutter_study_case/view_model/base_view_model.dart';

class ExercisesViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    print("object");
    notifyListeners();
  }

  deneme() {
    print("oldu");
  }
}
