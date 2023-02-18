import 'package:mytraining/src/core/entities/session/workout_session.dart';

abstract class WorkoutSessionRepository {
  void save(WorkoutSession workoutSession);
  List<WorkoutSession> getAll();
}