import 'package:collection/collection.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

class WorkoutSession {
  final String title;
  final Set<WorkoutSessionExercise> _sessionExercises;
  double _sessionProgress = 0.0;

  WorkoutSession._(this.title, this._sessionExercises) {
    _validateExercises();
  }

  static WorkoutSession from(Workout workout) {
    return WorkoutSession._(
        workout.title,
        workout.exercises
            .map((exercise) => WorkoutSessionExercise(exercise))
            .toSet());
  }

  void completeRepetition(WorkoutExercise workoutExercise) {
    _sessionExercises
        .firstWhereOrNull((sessionExercise) =>
            sessionExercise.workoutExercise == workoutExercise)
        ?.completeRepetition();

    _updateSessionProgress();
  }

  double getProgress() => _sessionProgress;

  bool isCompleted() {
    return _sessionProgress == 1.0;
  }

  void _updateSessionProgress() {
    double globalProgress = _progressList().reduce((value, element) => value + element);
    _sessionProgress = globalProgress / _sessionExercises.length;
  }

  Iterable<double> _progressList() => _sessionExercises.map((e) => e.getProgress());

  void _validateExercises() {
    if (_sessionExercises.isEmpty) {
      throw ArgumentError("a session must have some exercises");
    }
  }
}
