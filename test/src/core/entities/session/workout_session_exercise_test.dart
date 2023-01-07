import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';

main() {
  late WorkoutSessionExercise sessionExercise;
  const repetitions = 12;
  const sets = 2;
  const totalRepetitions = sets * repetitions;
  final workoutExercise = WorkoutExercise(
      ExerciseName.legPress, ExerciseType.olympic, sets, repetitions, "30KG");
  final workoutExerciseWithDifferentLoad = WorkoutExercise(
      ExerciseName.legPress, ExerciseType.olympic, sets, repetitions, "20KG");
  const halfProgress = 0.5;
  const fullProgress = 1.0;

  setUp(() {
    sessionExercise = WorkoutSessionExercise(workoutExercise);
  });

  test('increase progress when completes a repetition', () {
    sessionExercise.completeRepetition();

    sessionExercise.getProgress().shouldBeEqualTo(1 / totalRepetitions);
  });

  test('increase progress when completes all repetition from a set', () {
    completeSetRepetitions(repetitions, sessionExercise);

    sessionExercise.getProgress().shouldBeEqualTo(halfProgress);
  });

  test('full progress when completes all repetitions from all sets', () {
    completeAllSessionExercises(sets, repetitions, sessionExercise);

    sessionExercise.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('complete more repetitions do nothing', () {
    completeAllSessionExercises(sets, repetitions, sessionExercise);

    sessionExercise.completeRepetition();

    sessionExercise.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('test equals', () {
    WorkoutSessionExercise sameExercise = WorkoutSessionExercise(workoutExercise);

    sessionExercise.shouldBeEqualTo(sameExercise);
  });

  test('session exercises are the same if workout exercise is the same ', () {
    WorkoutSessionExercise sameExercise =
    WorkoutSessionExercise(workoutExercise);

    sessionExercise.shouldBeEqualTo(sameExercise);
  });

  test('session exercises are not the same if workout load is different', () {
    WorkoutSessionExercise otherExercise =
    WorkoutSessionExercise(workoutExerciseWithDifferentLoad);

    sessionExercise.shouldNotBeEqualTo(otherExercise);
  });
}

void completeAllSessionExercises(int sets, int repetitions, WorkoutSessionExercise sessionExercise) {
  for (int i = 0; i < sets; i++) {
    completeSetRepetitions(repetitions, sessionExercise);
  }
}

void completeSetRepetitions(int repetitions, WorkoutSessionExercise sessionExercise) {
  for (int i = 0; i < repetitions; i++) {
    sessionExercise.completeRepetition();
  }
}
