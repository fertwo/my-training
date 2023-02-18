import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

main() {
  late WorkoutExercise workoutExercise;
  const aName = ExerciseName.plank;
  const sets = 3;
  const repetitions = 12;
  const load = 8;
  const newLoad = 18;

  test('create a valid workout exercise', () {
    workoutExercise =
        WorkoutExercise(aName, ExerciseType.cardio, sets, repetitions, load);

    assert(workoutExercise.name == aName);
    assert(workoutExercise.type == ExerciseType.cardio);
    assert(workoutExercise.sets == sets);
    assert(workoutExercise.repetitions == repetitions);
    assert(workoutExercise.load == load);
  });

  test('can not create a workout exercise with no sets', () {
    try {
      workoutExercise =
          WorkoutExercise(aName, ExerciseType.cardio, 0, repetitions, load);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });

  test('can not create a workout exercise with invalid sets', () {
    try {
      workoutExercise =
          WorkoutExercise(aName, ExerciseType.cardio, -1, repetitions, load);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });

  test('can not create a workout exercise with no repetitions', () {
    try {
      workoutExercise =
          WorkoutExercise(aName, ExerciseType.cardio, sets, 0, load);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });

  test('can not create a workout exercise with invalid repetitions', () {
    try {
      workoutExercise =
          WorkoutExercise(aName, ExerciseType.cardio, sets, -10, load);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });

  test('update exercise load', () {
    workoutExercise =
        WorkoutExercise(aName, ExerciseType.cardio, sets, repetitions, load);

    workoutExercise.updateLoad(newLoad);

    workoutExercise.load.shouldBeEqualTo(newLoad);
  });
}
