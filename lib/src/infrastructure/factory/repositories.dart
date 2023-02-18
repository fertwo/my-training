import 'package:mytraining/src/core/repository/workout_session_repository.dart';
import 'package:mytraining/src/infrastructure/repository/in_memory_workout_session_repository.dart';

class Repositories {
  static WorkoutSessionRepository workoutSessionRepository = InMemoryWorkoutSessionRepository();
}