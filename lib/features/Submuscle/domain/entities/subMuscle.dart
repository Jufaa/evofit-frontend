import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';

class SubMuscle {
  int? submuscle_id;
  String name;
  int main_muscle_id;

  SubMuscle({
    this.submuscle_id,
    required this.name,
    required this.main_muscle_id,
  });
}
