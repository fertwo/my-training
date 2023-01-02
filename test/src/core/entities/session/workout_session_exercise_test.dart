import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/set_progress.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';

main() {
  late WorkoutSessionExercise sessionExercise;
  late List<SetProgress> twoSets;
  final workoutExercise =
      WorkoutExercise("legs", ExerciseType.olympic, 3, 12, "30KG");
  const halfProgress = 0.5;
  const totalRepetitions = 6;
  const fullProgress = 1.0;

  setUp(() {
    twoSets = [SetProgress(3), SetProgress(3)];
    sessionExercise = WorkoutSessionExercise(workoutExercise, twoSets);
  });

  test('increase progress when completes a repetition', () {
    sessionExercise.completeRepetition();

    sessionExercise.getProgress().shouldBeEqualTo(1 / totalRepetitions);
  });

  test('increase progress when completes all repetition from a set', () {
    twoSets.first.getRepetitions().forEach((_) {
      sessionExercise.completeRepetition();
    });

    sessionExercise.getProgress().shouldBeEqualTo(halfProgress);
  });

  test('full progress when completes all repetitions from all sets', () {
    for (var currentSet in twoSets) {
      currentSet.getRepetitions().forEach((repetition) => sessionExercise.completeRepetition());
    }

    sessionExercise.getProgress().shouldBeEqualTo(fullProgress);
  });
}
