import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine_exercises/data/models/routine_exercise_model.dart';

class RoutineModel extends Routine {
  RoutineModel({
    required super.name,
    required super.weeks,
    required super.days,
    required super.user_id,
  });

  factory RoutineModel.fromJson(json) {
    return RoutineModel(
      name: json['name_routine'],
      weeks: json['weeks'],
      days: json['days'],
      user_id: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_routine': name,
      'weeks': weeks,
      'days': days,
      'user_id': user_id,
    };
  }

  factory RoutineModel.fromEntity(Routine routine) {
    return RoutineModel(
      name: routine.name,
      weeks: routine.weeks,
      days: routine.days,
      user_id: routine.user_id,
    );
  }
}
