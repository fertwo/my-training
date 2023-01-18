import 'package:fake_async/fake_async.dart';
import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';
import 'package:mytraining/src/presentation/workouts/session/workout_session_view_model.dart';

import '../../mocks/mock_callback.dart';

main() {
  late WorkoutSessionViewModel viewModel;
  final WorkoutExercise legPress = WorkoutExercise(
      ExerciseName.legPress, ExerciseType.olympic, 1, 2, "30KG");
  final WorkoutExercise arnoldPress = WorkoutExercise(
      ExerciseName.arnoldPress, ExerciseType.shoulders, 1, 2, "30KG");
  final WorkoutSessionExercise legPressSessionExercise =
      WorkoutSessionExercise(legPress);
  final WorkoutSessionExercise arnoldPressSessionExercise =
      WorkoutSessionExercise(arnoldPress);
  late Workout aWorkout;
  late MockCallback sessionFinishedCallback;
  late List<WorkoutExercise> exercises;
  late Set<WorkoutSessionExercise> sessionExercises;
  late MockCallback callback;

  setUp(() {
    exercises = [legPress, arnoldPress];
    sessionExercises = {legPressSessionExercise, arnoldPressSessionExercise};
    sessionFinishedCallback = MockCallback();
    callback = MockCallback();
    aWorkout = Workout("workoutTitle", exercises);
    viewModel = WorkoutSessionViewModel(sessionFinishedCallback);
  });

  test('create session from workout when view is initialized', () {
    viewModel.onViewInitialized(aWorkout);

    viewModel.workoutSession.sessionExercises.shouldBeEqualTo(sessionExercises);
  });

  test('notify listeners when view is initialized', () {
    fakeAsync((async) {
      viewModel.addListener(callback);
      viewModel.onViewInitialized(aWorkout);

      async.flushMicrotasks();

      verify(callback()).called(1);
    });
  });

  test('session is not finished when view is initialized', () {
    fakeAsync((async) {
      viewModel.onViewInitialized(aWorkout);
      async.flushMicrotasks();

      verifyNever(sessionFinishedCallback());
    });
  });

  test('session is finished when completes all exercises', () {
    fakeAsync((async) {
      viewModel.onViewInitialized(aWorkout);

      viewModel.completeExercise(legPressSessionExercise);
      viewModel.completeExercise(arnoldPressSessionExercise);

      async.flushMicrotasks();

      verify(sessionFinishedCallback()).called(1);
    });
  });
}
