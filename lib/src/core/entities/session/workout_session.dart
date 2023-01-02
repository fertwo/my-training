import 'package:mytraining/src/core/entities/workout.dart';

class WorkoutSession {
  final String title;
  var progress = 0;

  WorkoutSession._(this.title);

  static WorkoutSession from(Workout aWorkout) {
    return WorkoutSession._(aWorkout.title);
  }
}