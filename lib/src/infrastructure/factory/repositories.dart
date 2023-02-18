import 'package:mytraining/src/core/repository/workout_session_repository.dart';
import 'package:mytraining/src/infrastructure/repository/in_memory_workout_session_repository.dart';
import 'package:mytraining/src/infrastructure/repository/stub_workout_repository.dart';

import '../../core/repository/workout_repository.dart';

class Repositories {
  static WorkoutRepository workoutRepository = StubWorkoutRepository();
  static WorkoutSessionRepository workoutSessionRepository = InMemoryWorkoutSessionRepository();
}