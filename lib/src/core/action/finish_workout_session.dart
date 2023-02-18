import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/repository/workout_repository.dart';
import 'package:mytraining/src/core/repository/workout_session_repository.dart';

class FinishWorkoutSession {
  final WorkoutSessionRepository workoutSessionRepository;
  final WorkoutRepository workoutRepository;

  FinishWorkoutSession(this.workoutRepository, this.workoutSessionRepository);

  void call(WorkoutSession workoutSession) {
    workoutSessionRepository.save(workoutSession);
    workoutRepository.save(workoutSession.toWorkout());
  }
}