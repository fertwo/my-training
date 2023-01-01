import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise_type.dart';
import 'package:mytraining/src/core/entities/workout.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';
import 'package:mytraining/src/core/error/duplicate_workout_exercise_error.dart';

main() {
  late Workout workout;
  const aValidTitle = "A Workout Title";
  const anEmptyTitle = "";
  List<WorkoutExercise> exercises = [
    WorkoutExercise("legs", ExerciseType.olympic, 3, 12, "30KG"),
    WorkoutExercise("shoulders", ExerciseType.shoulders, 3, 12, "20KG")
  ];
  final newExercise = WorkoutExercise("arms", ExerciseType.arms, 3, 12, "10KG");
  List<WorkoutExercise> noExercises = [];

  test('create a valid workout', () {
    workout = Workout(aValidTitle, exercises);

    assert(workout.title == aValidTitle);
    assert(workout.exercises == exercises);
  });

  test('create a workout without exercises', () {
    workout = Workout(aValidTitle, noExercises);

    assert(workout.exercises.isEmpty);
  });

  test('add exercises to a workout', () {
    workout = Workout(aValidTitle, noExercises);

    workout.addExercise(newExercise);

    assert(workout.exercises.length == 1);
    assert(workout.exercises.first == newExercise);
  });

  test('can not add same exercise twice', () {
    workout = Workout(aValidTitle, noExercises);

    try {
      workout.addExercise(newExercise);
      workout.addExercise(newExercise);
      assert(false);
    } catch (error) {
      assert(error is DuplicateWorkoutExerciseError);
    }
  });

  test('can not create a workout with no title', () {
    try {
      workout = Workout(anEmptyTitle, exercises);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });
}
