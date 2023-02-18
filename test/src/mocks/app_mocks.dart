import 'package:mockito/annotations.dart';
import 'package:mytraining/src/core/action/finish_workout_session.dart';
import 'package:mytraining/src/core/action/get_workouts.dart';
import 'package:mytraining/src/core/repository/workout_repository.dart';

@GenerateMocks([
  GetWorkouts,
  FinishWorkoutSession,
  WorkoutRepository
])
class AppMocks {}