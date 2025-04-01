// ignore_for_file: non_constant_identifier_names

class Routine {
  int? routine_id;
  String name;
  int weeks;
  int days;
  int user_id;

  Routine({
    this.routine_id,
    required this.name,
    required this.weeks,
    required this.days,
    required this.user_id,
  });
}
