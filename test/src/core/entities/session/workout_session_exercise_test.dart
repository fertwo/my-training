import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

main() {
  late WorkoutSessionExercise sessionExercise;
  const repetitions = 12;
  const sets = 2;
  final workoutExercise = WorkoutExercise(
      ExerciseName.horizontalLegPress, ExerciseType.olympic, sets, repetitions, 30);
  final workoutExerciseWithDifferentLoad = WorkoutExercise(
      ExerciseName.horizontalLegPress, ExerciseType.olympic, sets, repetitions, 20);
  const fullProgress = 1.0;

  setUp(() {
    sessionExercise = WorkoutSessionExercise(workoutExercise);
  });

  test('increase progress when completes a set', () {
    sessionExercise.completeSet();

    sessionExercise.getProgress().shouldBeEqualTo(1 / sets);
  });

  test('full progress when completes all sets', () {
    completeAllSessionExercises(sets, sessionExercise);

    sessionExercise.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('complete more sets do nothing', () {
    completeAllSessionExercises(sets, sessionExercise);

    sessionExercise.completeSet();

    sessionExercise.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('test equals', () {
    final WorkoutSessionExercise sameExercise =
        WorkoutSessionExercise(workoutExercise);

    sessionExercise.shouldBeEqualTo(sameExercise);
  });

  test('session exercises are the same if workout exercise is the same ', () {
    final WorkoutSessionExercise sameExercise =
        WorkoutSessionExercise(workoutExercise);

    sessionExercise.shouldBeEqualTo(sameExercise);
  });

  test('session exercises are not the same if workout load is different', () {
    final WorkoutSessionExercise otherExercise =
        WorkoutSessionExercise(workoutExerciseWithDifferentLoad);

    sessionExercise.shouldNotBeEqualTo(otherExercise);
  });

  test('complete all sets of an exercise', () {
    sessionExercise.complete();

    sessionExercise.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('restart all sets of an exercise', () {
    sessionExercise.complete();

    sessionExercise.restart();

    sessionExercise.getProgress().shouldBeEqualTo(0);
  });
}

void completeAllSessionExercises(
    int sets, WorkoutSessionExercise sessionExercise) {
  for (int i = 0; i < sets; i++) {
    completeSet(sessionExercise);
  }
}

void completeSet(WorkoutSessionExercise sessionExercise) {
  sessionExercise.completeSet();
}
