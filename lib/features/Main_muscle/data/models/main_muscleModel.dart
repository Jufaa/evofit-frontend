import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';
import 'package:frontend/features/Submuscle/data/models/subMuscleModel.dart';
import 'package:frontend/features/Submuscle/domain/entities/subMuscle.dart';

class MainMuscleModel extends MainMuscle {
  MainMuscleModel({required int main_muscle_id, required String name})
    : super(main_muscle_id: main_muscle_id, name: name);

  factory MainMuscleModel.fromJson(Map<String, dynamic> json) {
    return MainMuscleModel(
      main_muscle_id: json['main_muscle_id'],
      name: json['name'],
    );
  }
}
