import 'package:collection/collection.dart';
import 'package:mytraining/l10n/app_localizations.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';

class WorkoutFormatter {
  static String getExerciseTypesFrom(
      Workout workout, AppLocalizations appLocalizations) {
    return workout.exercises
        .map((exercise) =>
            _localizedExerciseName(exercise.type, appLocalizations))
        .toSet()
        .sortedBy((name) => name)
        .join("/");
  }

  static String _localizedExerciseName(
      ExerciseType exercise, AppLocalizations appLocalizations) {
    switch (exercise) {
      case ExerciseType.abdomen:
        return appLocalizations.abdomen;
      case ExerciseType.arms:
        return appLocalizations.arms;
      case ExerciseType.back:
        return appLocalizations.back;
      case ExerciseType.cardio:
        return appLocalizations.cardio;
      case ExerciseType.chest:
        return appLocalizations.chest;
      case ExerciseType.core:
        return appLocalizations.core;
      case ExerciseType.fullBody:
        return appLocalizations.fullBody;
      case ExerciseType.legs:
        return appLocalizations.legs;
      case ExerciseType.olympic:
        return appLocalizations.olympic;
      case ExerciseType.shoulders:
        return appLocalizations.shoulders;
    }
  }
}
