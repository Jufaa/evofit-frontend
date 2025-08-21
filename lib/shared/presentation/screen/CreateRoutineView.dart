import 'package:flutter/material.dart';
import 'package:frontend/features/Routine/domain/use_cases/createRoutineUseCase.dart';
import 'package:frontend/shared/presentation/entities/user_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CreateRoutineView extends StatefulWidget {
  const CreateRoutineView({super.key});

  @override
  State<CreateRoutineView> createState() => _CreateRoutineViewState();
}

final CreateRoutineUseCase _createRoutineUseCase =
    GetIt.instance.get<CreateRoutineUseCase>();

class _CreateRoutineViewState extends State<CreateRoutineView> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final weeksController = TextEditingController();
  final daysController = TextEditingController();
  List<ExerciseForm> exercises = [];

  void addExercise() {
    setState(() => exercises.add(ExerciseForm()));
  }

  void removeExercise(int index) {
    setState(() => exercises.removeAt(index));
  }

  Future<void> saveRoutine() async {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final weeks = int.parse(weeksController.text);
      final days = int.parse(daysController.text);
      final routineExercises = exercises.map((e) => e.getData()).toList();

      print("Rutina: $name ($weeks semanas, $days días)");
      for (var ex in routineExercises) {
        print("Ejercicio: $ex");
      }
      final userProvider = Provider.of<UserProvider>(context);
      final user = userProvider.user;
      if (user == null) {
        print("Usuario no logueado");
        return;
      }

      final result = await _createRoutineUseCase(name, weeks, days, user.id!);
      print("Resultado de la creación: $result");
      Navigator.pop(context); // volver a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Rutina"),
        backgroundColor: const Color(0xFF002B0E),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nombre de la rutina",
                ),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: weeksController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Semanas"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                controller: daysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Días por semana"),
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Ejercicios",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...exercises.asMap().entries.map((entry) {
                final index = entry.key;
                final widget = entry.value;
                return Column(
                  children: [
                    widget,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => removeExercise(index),
                        child: const Text(
                          "Eliminar",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }),
              OutlinedButton.icon(
                onPressed: addExercise,
                icon: const Icon(Icons.add),
                label: const Text("Agregar ejercicio"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF002B0E),
                  side: const BorderSide(color: Color(0xFF3CBC18)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveRoutine,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF002B0E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 32,
                  ),
                ),
                child: const Text("Guardar Rutina"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseForm extends StatefulWidget {
  final exerciseIdController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();
  final weightController = TextEditingController();

  Map<String, dynamic> getData() => {
    "exercise_id": int.tryParse(exerciseIdController.text),
    "sets": int.tryParse(setsController.text),
    "reps": int.tryParse(repsController.text),
    "weight": double.tryParse(weightController.text),
  };

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.exerciseIdController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "ID del ejercicio"),
          validator: (value) => value!.isEmpty ? "Campo requerido" : null,
        ),
        TextFormField(
          controller: widget.setsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Series (sets)"),
          validator: (value) => value!.isEmpty ? "Campo requerido" : null,
        ),
        TextFormField(
          controller: widget.repsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Repeticiones (reps)"),
          validator: (value) => value!.isEmpty ? "Campo requerido" : null,
        ),
        TextFormField(
          controller: widget.weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Peso (kg)"),
          validator: (value) => value!.isEmpty ? "Campo requerido" : null,
        ),
      ],
    );
  }
}
