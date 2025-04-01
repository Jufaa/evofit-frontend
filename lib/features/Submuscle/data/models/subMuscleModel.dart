import 'package:frontend/features/Submuscle/domain/entities/subMuscle.dart';

class SubmuscleModel extends SubMuscle {
  SubmuscleModel({required String name, required int main_muscle_id})
    : super(name: name, main_muscle_id: main_muscle_id);

  factory SubmuscleModel.fromJson(Map<String, dynamic> json) {
    return SubmuscleModel(
      name: json['name'],
      main_muscle_id: json['main_muscle_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'submuscle_id': submuscle_id,
      'name': name,
      'main_muscle_id': main_muscle_id,
    };
  }

  factory SubmuscleModel.fromEntity(SubMuscle subMuscle) {
    return SubmuscleModel(
      name: subMuscle.name,
      main_muscle_id: subMuscle.main_muscle_id,
    );
  }
}
