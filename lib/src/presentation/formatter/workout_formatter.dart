import 'package:collection/collection.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';

class WorkoutFormatter {

  static String getExerciseTypesFrom(Workout workout) {
    return workout.exercises.map((exercise) => exercise.type.name).toSet().sortedBy((name) => name).join("/");
  }
}