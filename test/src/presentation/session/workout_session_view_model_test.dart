import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';
import 'package:mytraining/src/presentation/workouts/session/workout_session_view_model.dart';

import '../../mocks/app_mocks.mocks.dart';
import '../../mocks/mock_callback.dart';

main() {
  late WorkoutSessionViewModel viewModel;
  final WorkoutExercise legPress = WorkoutExercise(
      ExerciseName.horizontalLegPress, ExerciseType.olympic, 1, 2, 30);
  final WorkoutExercise arnoldPress = WorkoutExercise(
      ExerciseName.arnoldPress, ExerciseType.shoulders, 1, 2, 30);
  const newLoad = 88;
  final WorkoutSessionExercise legPressSessionExercise =
      WorkoutSessionExercise(legPress);
  final WorkoutSessionExercise arnoldPressSessionExercise =
      WorkoutSessionExercise(arnoldPress);
  late Workout aWorkout;
  late MockCallback sessionFinishedCallback;
  late List<WorkoutExercise> exercises;
  late Set<WorkoutSessionExercise> sessionExercises;
  late MockCallback callback;
  late MockFinishWorkoutSession finishWorkout;

  setUp(() {
    exercises = [legPress, arnoldPress];
    sessionExercises = {legPressSessionExercise, arnoldPressSessionExercise};
    sessionFinishedCallback = MockCallback();
    callback = MockCallback();
    finishWorkout = MockFinishWorkoutSession();
    aWorkout = Workout(1, "workoutTitle", exercises);
    viewModel = WorkoutSessionViewModel(sessionFinishedCallback, finishWorkout);
  });

  test('create session from workout when view is initialized', () {
    viewModel.onViewInitialized(aWorkout);

    viewModel.workoutSession.sessionExercises.shouldBeEqualTo(sessionExercises);
  });

  test('notify listeners when view is initialized', () {
    viewModel.addListener(callback);
    viewModel.onViewInitialized(aWorkout);

    verify(callback()).called(1);
  });

  test('session is not finished when view is initialized', () {
    viewModel.onViewInitialized(aWorkout);

    verifyNever(sessionFinishedCallback());
  });

  test('session is finished when completes all exercises', () {
    viewModel.onViewInitialized(aWorkout);

    viewModel.completeExerciseClicked(legPressSessionExercise);
    viewModel.completeExerciseClicked(arnoldPressSessionExercise);

    verify(sessionFinishedCallback()).called(1);
  });

  test('finish workout when completes all exercises', () {
    viewModel.onViewInitialized(aWorkout);

    viewModel.completeExerciseClicked(legPressSessionExercise);
    viewModel.completeExerciseClicked(arnoldPressSessionExercise);

    verify(finishWorkout(any)).called(1);
  });

  test('update exercise load', () {
    viewModel.addListener(callback);
    viewModel.onViewInitialized(aWorkout);

    viewModel.onNewLoadAdded(arnoldPressSessionExercise, newLoad);

    viewModel.workoutSession.sessionExercises
        .toList()[1]
        .load()
        .shouldBeEqualTo(newLoad);
    verify(callback()).called(2);
  });
}
