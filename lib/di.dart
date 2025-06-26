import 'package:frontend/injection/exercise_injection.dart';
import 'package:frontend/injection/mainMuscle_injection.dart';
import 'package:frontend/injection/routine_exercise_injection.dart';
import 'package:frontend/injection/routine_injection.dart';
import 'package:frontend/injection/user_injection.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
  initUserDependencies(di);
  initRoutineDependencies(di);
  initRoutineExerciseDependencies(di);
  initExerciseDependencies(di);
  initMainMuscleDependencies(di);
}
