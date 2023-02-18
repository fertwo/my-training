import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';
import 'package:mytraining/src/core/error/duplicate_workout_exercise_error.dart';

main() {
  late Workout workoutWithNoExercises;
  late Workout aWorkout;
  const aValidTitle = "A Workout Title";
  const anEmptyTitle = "";
  late List<WorkoutExercise> exercises;
  final newExercise = WorkoutExercise(ExerciseName.arnoldPress, ExerciseType.arms, 3, 12, 10);
  final sameExerciseDifferentLoad = WorkoutExercise(ExerciseName.arnoldPress, ExerciseType.arms, 3, 12, 20);

  setUp(() {
    exercises = [
      WorkoutExercise(
          ExerciseName.legPress, ExerciseType.olympic, 3, 12, 30),
      WorkoutExercise(
          ExerciseName.benchPress, ExerciseType.shoulders, 3, 12, 20)
    ];
    workoutWithNoExercises = Workout(1, aValidTitle, List.empty(growable: true));
    aWorkout = Workout(2, aValidTitle, exercises);
  });

  test('create a valid workout', () {
    assert(aWorkout.title == aValidTitle);
    assert(aWorkout.exercises == exercises);
  });

  test('create a workout without exercises', () {
    assert(workoutWithNoExercises.exercises.isEmpty);
  });

  test('add exercises to a workout', () {
    workoutWithNoExercises.addExercise(newExercise);

    assert(workoutWithNoExercises.exercises.length == 1);
    assert(workoutWithNoExercises.exercises.first == newExercise);
  });

  test('can not add same exercise twice', () {
    try {
      workoutWithNoExercises.addExercise(newExercise);
      workoutWithNoExercises.addExercise(newExercise);
      assert(false);
    } catch (error) {
      assert(error is DuplicateWorkoutExerciseError);
    }
  });

  test('can add same exercise with different loads', () {
    workoutWithNoExercises.addExercise(newExercise);
    workoutWithNoExercises.addExercise(sameExerciseDifferentLoad);

    assert(workoutWithNoExercises.exercises.length == 2);
  });

  test('can not create a workout with no title', () {
    try {
      Workout(1, anEmptyTitle, exercises);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });
}
