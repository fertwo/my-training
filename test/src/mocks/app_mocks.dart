import 'package:mockito/annotations.dart';
import 'package:mytraining/src/core/action/finish_workout_session.dart';
import 'package:mytraining/src/core/action/get_workouts.dart';

@GenerateMocks([
  GetWorkouts,
  FinishWorkoutSession
])
class AppMocks {}