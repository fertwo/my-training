import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

main() {
  late WorkoutSession workoutSession;
  const workoutTitle = "My workout";
  late Workout workout;
  late Workout workoutWithNoExercises;
  late List<WorkoutExercise> exercises;
  double quarterProgress = 0.25;
  double halfProgress = 0.5;
  double fullProgress = 1;
  final WorkoutExercise heavyLegPress = WorkoutExercise(
      ExerciseName.legPress, ExerciseType.olympic, 2, 2, "30KG");
  final WorkoutExercise legPress = WorkoutExercise(
      ExerciseName.legPress, ExerciseType.olympic, 1, 2, "30KG");
  final WorkoutExercise arnoldPress = WorkoutExercise(
      ExerciseName.arnoldPress, ExerciseType.shoulders, 1, 2, "30KG");
  final WorkoutSessionExercise legPressSessionExercise =
      WorkoutSessionExercise(legPress);
  final WorkoutSessionExercise arnoldPressSessionExercise =
      WorkoutSessionExercise(arnoldPress);
  final WorkoutSessionExercise heavyLegPressSessionExercise =
  WorkoutSessionExercise(heavyLegPress);
  setUp(() {
    exercises = [legPress, arnoldPress];
    workout = Workout(workoutTitle, exercises);
    workoutSession = WorkoutSession.from(workout);
    workoutWithNoExercises = Workout(workoutTitle, const []);
  });

  test('a session starts with zero progress', () {
    workoutSession.getProgress().shouldBeZero();
  });

  test('a session has same name than workout', () {
    workoutSession.title.shouldBeEqualTo(workoutTitle);
  });

  test('can not create a session with no exercises', () {
    try {
      workoutSession = WorkoutSession.from(workoutWithNoExercises);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });

  test('completing half session repetitions should return half progress', () {
    completeAllExerciseSets(workoutSession, legPressSessionExercise);

    workoutSession.getProgress().shouldBeEqualTo(halfProgress);
  });

  test('complete all session sets', () {
    completeAllSessionSets(
        workoutSession, legPressSessionExercise, arnoldPressSessionExercise);

    workoutSession.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('session is completed when completes all session sets', () {
    completeAllSessionSets(workoutSession, legPressSessionExercise, arnoldPressSessionExercise);
    workoutSession.isCompleted().shouldBeTrue();
  });

  test('session is not completed when remains some sets to do', () {
    workoutSession.completeSet(legPressSessionExercise);

    workoutSession.isCompleted().shouldBeFalse();
  });

  test('reduce progress when restarts exercise from session', () {
    completeAllSessionSets(
        workoutSession, legPressSessionExercise, arnoldPressSessionExercise);

    workoutSession.restartExercise(legPressSessionExercise);

    workoutSession.getProgress().shouldBeEqualTo(halfProgress);
  });

  test('complete one set exercise from session', () {
    workout = Workout(workoutTitle, [heavyLegPress, arnoldPress]);
    workoutSession = WorkoutSession.from(workout);

    workoutSession.completeSet(heavyLegPressSessionExercise);

    workoutSession.getProgress().shouldBeEqualTo(quarterProgress);
  });

}

void completeAllExerciseSets(
    WorkoutSession workoutSession, WorkoutSessionExercise exercise) {
  workoutSession.completeExercise(exercise);
}

void completeAllSessionSets(WorkoutSession workoutSession,
    WorkoutSessionExercise firstExercise, WorkoutSessionExercise secondExercise) {
  completeAllExerciseSets(workoutSession, firstExercise);
  completeAllExerciseSets(workoutSession, secondExercise);
}
