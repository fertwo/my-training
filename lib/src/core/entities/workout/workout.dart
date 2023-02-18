import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';
import 'package:mytraining/src/core/error/duplicate_workout_exercise_error.dart';

@immutable
class Workout {
  final int id;
  final String title;
  final List<WorkoutExercise> exercises;

  Workout(this.id, this.title, this.exercises) {
    _validateWorkout();
  }

  void _validateWorkout() {
    if (title.isEmpty) {
      throw ArgumentError("invalid workout, title can not be empty");
    }
  }

  void addExercise(WorkoutExercise newExercise) {
    _validateExerciseIsNotRepeated(newExercise);
    exercises.add(newExercise);
  }

  void _validateExerciseIsNotRepeated(WorkoutExercise newExercise) {
    if (exercises.contains(newExercise)) throw DuplicateWorkoutExerciseError();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Workout && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
