import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/entities/workout.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';

main() {
  late WorkoutSession workoutSession;
  const workoutTitle = "My workout";
  late Workout workout;
  late Workout workoutWithNoExercises;
  late List<WorkoutExercise> exercises;
  double halfProgress = 0.5;
  double fullProgress = 1;
  final WorkoutExercise legPress = WorkoutExercise(
      ExerciseName.legPress, ExerciseType.olympic, 1, 2, "30KG");
  final WorkoutExercise arnoldPress = WorkoutExercise(
      ExerciseName.arnoldPress, ExerciseType.shoulders, 1, 2, "30KG");
  setUp(() {
    exercises = [
      legPress,
      arnoldPress
    ];
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

  test('complete exercise repetition', () {
    workoutSession.completeRepetition(legPress);

    workoutSession.getProgress().shouldBeEqualTo(1/4);
  });

  test('completing half session repetitions should return half progress', () {
    completeAllExerciseRepetitions(workoutSession, legPress);

    workoutSession.getProgress().shouldBeEqualTo(halfProgress);
  });

  test('complete all session repetitions', () {
    completeAllSessionRepetitions(workoutSession, legPress, arnoldPress);

    workoutSession.getProgress().shouldBeEqualTo(fullProgress);
  });

  test('session is completed when completes all session repetitions', () {
    completeAllSessionRepetitions(workoutSession, legPress, arnoldPress);

    workoutSession.isCompleted().shouldBeTrue();
  });

  test('session is not completed when remains some repetitions to do', () {
    workoutSession.completeRepetition(legPress);

    workoutSession.isCompleted().shouldBeFalse();
  });
}

void completeAllExerciseRepetitions(WorkoutSession workoutSession, WorkoutExercise legPress) {
  workoutSession.completeRepetition(legPress);
  workoutSession.completeRepetition(legPress);
}

void completeAllSessionRepetitions(WorkoutSession workoutSession, WorkoutExercise legPress, WorkoutExercise arnoldPress) {
  completeAllExerciseRepetitions(workoutSession, legPress);
  completeAllExerciseRepetitions(workoutSession, arnoldPress);
}
