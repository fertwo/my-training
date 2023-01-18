import 'package:mytraining/src/core/entities/session/workout_session.dart';

abstract class WorkoutSessionRepository {
  Future<WorkoutSession> save(WorkoutSession workoutSession);
}