import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';
import 'package:mytraining/src/core/error/duplicate_workout_exercise_error.dart';

@immutable
class Workout {
  final String title;
  final List<WorkoutExercise> exercises;

  Workout(this.title, this.exercises) {
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
      other is Workout &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          exercises == other.exercises;

  @override
  int get hashCode => title.hashCode ^ exercises.hashCode;
}
