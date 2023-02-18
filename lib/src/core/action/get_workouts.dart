import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/repository/workout_repository.dart';

class GetWorkouts {
  final WorkoutRepository repository;

  GetWorkouts(this.repository);

  Future<List<Workout>> call() {
    return Future.value(repository.getAll());
  }
}
