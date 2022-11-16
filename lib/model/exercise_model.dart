class ExerciseModel {
  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instructions;

  ExerciseModel(
      {this.name,
      this.type,
      this.muscle,
      this.equipment,
      this.difficulty,
      this.instructions});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulity'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['muscle'] = this.muscle;
    data['equipment'] = this.equipment;
    data['difficulity'] = this.difficulty;
    data['instructions'] = this.instructions;
    return data;
  }
}
