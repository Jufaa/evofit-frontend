import 'package:frontend/features/Submuscle/domain/entities/subMuscle.dart';

class MainMuscle {
  int? main_muscle_id;
  String name;
  //List<SubMuscle>? submuscles; TODO:: ADD THIS IN FUTURE

  MainMuscle({
    this.main_muscle_id,
    required this.name,
    //this.submuscles,
  });
}
