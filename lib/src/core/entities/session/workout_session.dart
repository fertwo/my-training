import 'package:collection/collection.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';

class WorkoutSession {
  final int id;
  final String title;
  final Set<WorkoutSessionExercise> sessionExercises;
  double _sessionProgress = 0.0;

  WorkoutSession._(this.id, this.title, this.sessionExercises) {
    _validateExercises();
  }

  static WorkoutSession from(Workout workout) {
    return WorkoutSession._(
        workout.id,
        workout.title,
        workout.exercises
            .map((exercise) => WorkoutSessionExercise(exercise))
            .toSet());
  }

  void completeSet(WorkoutSessionExercise sessionExercise) {
    sessionExercises
        .firstWhereOrNull((currentSessionExercise) =>
          currentSessionExercise == sessionExercise)
        ?.completeSet();

    _updateSessionProgress();
  }

  void completeExercise(WorkoutSessionExercise sessionExercise) {
    sessionExercises
        .firstWhereOrNull((currentSessionExercise) =>
    currentSessionExercise == sessionExercise)
        ?.complete();

    _updateSessionProgress();
  }

  void restartExercise(WorkoutSessionExercise sessionExercise) {
    sessionExercises
        .firstWhereOrNull((currentSessionExercise) =>
    currentSessionExercise == sessionExercise)
        ?.restart();

    _updateSessionProgress();
  }

  double getProgress() => _sessionProgress;

  bool isCompleted() {
    return _sessionProgress == 1.0;
  }

  Workout toWorkout() {
    return Workout(id, title, sessionExercises.map((e) => e.getWorkoutExercise()).toList());
  }

  void _updateSessionProgress() {
    double globalProgress = _progressList().reduce((value, element) => value + element);
    _sessionProgress = globalProgress / sessionExercises.length;
  }

  Iterable<double> _progressList() => sessionExercises.map((e) => e.getProgress());

  void _validateExercises() {
    if (sessionExercises.isEmpty) {
      throw ArgumentError("a session must have some exercises");
    }
  }
}
