import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/repository/workout_session_repository.dart';

class InMemoryWorkoutSessionRepository implements WorkoutSessionRepository {
  WorkoutSession? workoutSession;

  @override
  Future<WorkoutSession> save(WorkoutSession workoutSession) {
    return Future.value(this.workoutSession = workoutSession);
  }
}