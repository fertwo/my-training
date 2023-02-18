import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/repository/workout_session_repository.dart';

class FinishWorkoutSession {
  final WorkoutSessionRepository repository;

  FinishWorkoutSession(this.repository);

  void call(WorkoutSession workoutSession) {
    repository.save(workoutSession);
  }
}