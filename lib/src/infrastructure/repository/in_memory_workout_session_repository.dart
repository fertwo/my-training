import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/repository/workout_session_repository.dart';

class InMemoryWorkoutSessionRepository implements WorkoutSessionRepository {
  List<WorkoutSession> workoutSessions = [];

  @override
  void save(WorkoutSession workoutSession) {
    workoutSessions.add(workoutSession);
  }

  @override
  List<WorkoutSession> getAll() {
    return workoutSessions;
  }
}