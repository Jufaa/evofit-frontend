import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';

class MainMuscleModel extends MainMuscle {
  MainMuscleModel({required int super.main_muscle_id, required super.name});

  factory MainMuscleModel.fromJson(Map<String, dynamic> json) {
    return MainMuscleModel(
      main_muscle_id: json['main_muscle_id'],
      name: json['name'],
    );
  }
}
