import 'package:frontend/features/Routine/domain/entities/Routine.dart';

class RoutineModel extends Routine {
  RoutineModel({
    required super.name_routine,
    required super.user_id,
    super.routine_id,
    super.user,
    super.routine_exercises,
  });

  factory RoutineModel.fromJson(json) {
    return RoutineModel(
      name_routine: json['name_routine'],
      user_id: json['user_id'],
      routine_id: json['routine_id'],
      user: json['user'],
      routine_exercises: json['routine_exercises'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_routine': name_routine,
      'user_id': user_id,
      'routine_id': routine_id,
      'user': user,
      'routine_exercises': routine_exercises,
    };
  }

  factory RoutineModel.fromEntity(Routine routine) {
    return RoutineModel(
      name_routine: routine.name_routine,
      user_id: routine.user_id,
      routine_id: routine.routine_id,
      user: routine.user,
      routine_exercises: routine.routine_exercises,
    );
  }
}
