import 'package:mytraining/src/core/action/finish_workout_session.dart';
import 'package:mytraining/src/core/action/get_workouts.dart';
import 'package:mytraining/src/infrastructure/factory/repositories.dart';

class ActionsFactory {
  static GetWorkouts createGetWorkouts() =>
      GetWorkouts(Repositories.workoutRepository);

  static FinishWorkoutSession createFinishWorkoutSession() =>
      FinishWorkoutSession(Repositories.workoutRepository,
          Repositories.workoutSessionRepository);
}
