import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/entities/workout.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';

main() {
  late WorkoutSession workoutSession;
  const workoutTitle = "My workout";
  List<WorkoutExercise> exercises = [
    WorkoutExercise("legs", ExerciseType.olympic, 3, 12, "30KG"),
    WorkoutExercise("shoulders", ExerciseType.shoulders, 3, 12, "20KG")
  ];
  final aWorkout = Workout(workoutTitle, exercises);

  test('a session starts with zero progress', () {
    workoutSession = WorkoutSession.from(aWorkout);

    final progress = workoutSession.progress;

    progress.shouldBeZero();
  });

  test('a session has same name than workout', () {
    workoutSession = WorkoutSession.from(aWorkout);

    workoutSession.title.shouldBeEqualTo(workoutTitle);
  });
}