import 'package:flutter/material.dart';
import 'package:frontend/features/Exercises/domain/entities/exercise.dart';
import 'package:frontend/features/Exercises/domain/use_cases/getAllExercise.dart';
import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';
import 'package:frontend/features/Main_muscle/domain/use_cases/getAllMainMuscleUseCase.dart';
import 'package:get_it/get_it.dart';

class ListexerciseView extends StatefulWidget {
  const ListexerciseView({super.key});

  @override
  State<ListexerciseView> createState() => _ListexerciseViewState();
}

final GetAllExerciseUseCase _listExerciseUseCase =
    GetIt.instance.get<GetAllExerciseUseCase>();

final GetAllMainMuscleUseCase _getAllMainMuscleUseCase =
    GetIt.instance.get<GetAllMainMuscleUseCase>();

class _ListexerciseViewState extends State<ListexerciseView> {
  int? selectedMuscleId;

  List<Exercise> _allExercises = [];
  List<MainMuscle> _mainMuscles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    try {
      final result =
          await _listExerciseUseCase(); // esto es un Either<Failure, List<Exercise>>
      result.fold(
        (failure) {
          print('Falló la carga: ${failure}');
          setState(() {
            _isLoading = false;
          });
        },
        (exercises) {
          print('Ejercicios cargados: $exercises');
          setState(() {
            _allExercises = exercises;
            _isLoading = false;
          });
        },
      );
      final result2 = await _getAllMainMuscleUseCase();
      result2.fold(
        (failure) {
          print('Falló la carga de músculos: ${failure}');
          setState(() {
            _isLoading = false;
          });
        },
        (muscles) {
          print('Músculos cargados: $muscles');
          setState(() {
            _mainMuscles = muscles;
          });
        },
      );
    } catch (e) {
      print('Error inesperado: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Cuadros de músculo obtenidos de la API
            SizedBox(
              height: 150,
              child:
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _mainMuscles.isEmpty
                      ? const Center(
                        child: Text(
                          "No muscles found",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _mainMuscles.length,
                        itemBuilder: (context, index) {
                          final muscle = _mainMuscles[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMuscleId = muscle.main_muscle_id;
                              });
                            },
                            child: Container(
                              width: 120,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      selectedMuscleId == muscle.main_muscle_id
                                          ? Colors.white
                                          : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey[900],
                              ),
                              child: Center(
                                child: Text(
                                  muscle.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'ChalkboardSE',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),

            // Lista de ejercicios filtrados por mainMuscleId
            Expanded(
              child:
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _allExercises.isEmpty
                      ? const Center(
                        child: Text(
                          "No exercises found",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : ListView.builder(
                        itemCount:
                            _allExercises
                                .where(
                                  (e) =>
                                      selectedMuscleId == null
                                          ? true
                                          : e.main_muscle_id ==
                                              selectedMuscleId,
                                )
                                .length,
                        itemBuilder: (context, index) {
                          final exercises =
                              _allExercises
                                  .where(
                                    (e) =>
                                        selectedMuscleId == null
                                            ? true
                                            : e.main_muscle_id ==
                                                selectedMuscleId,
                                  )
                                  .toList();
                          final ex = exercises[index];
                          return Card(
                            color: Colors.grey[850],
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                ex.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                ex.description,
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
