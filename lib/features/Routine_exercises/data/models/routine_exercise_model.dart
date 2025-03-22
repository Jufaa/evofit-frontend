class RoutineExerciseModel {
  final int id;
  final int routineId;
  final int exerciseId;
  final int sets;
  final int reps;
  final int rest;
  final int order;

  RoutineExerciseModel({
    required this.id,
    required this.routineId,
    required this.exerciseId,
    required this.sets,
    required this.reps,
    required this.rest,
    required this.order,
  });

  factory RoutineExerciseModel.fromJson(Map<String, dynamic> json) =>
      RoutineExerciseModel(
        id: json['id'],
        routineId: json['routineId'],
        exerciseId: json['exerciseId'],
        sets: json['sets'],
        reps: json['reps'],
        rest: json['rest'],
        order: json['order'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'routineId': routineId,
    'exerciseId': exerciseId,
    'sets': sets,
    'reps': reps,
    'rest': rest,
    'order': order,
  };
}
