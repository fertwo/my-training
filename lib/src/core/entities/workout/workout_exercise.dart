import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/entities/exercise/exercise.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';

@immutable
class WorkoutExercise extends Exercise {
  final int sets;
  final int repetitions;
  final String load;

  WorkoutExercise(ExerciseName name, ExerciseType type, this.sets, this.repetitions,
      this.load) : super(name, type) {
    validateWorkoutExercise();
  }

  void validateWorkoutExercise() {
    if (sets <= 0) {
      throw ArgumentError("invalid workout exercise, sets must be greater than zero");
    }
    if (repetitions <= 0) {
      throw ArgumentError("invalid workout exercise, repetitions must be greater than zero");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is WorkoutExercise &&
          runtimeType == other.runtimeType &&
          sets == other.sets &&
          repetitions == other.repetitions &&
          load == other.load;

  @override
  int get hashCode =>
      super.hashCode ^ sets.hashCode ^ repetitions.hashCode ^ load.hashCode;
}