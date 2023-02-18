import '../entities/workout/workout.dart';

abstract class WorkoutRepository {
  void save(Workout workout);
  List<Workout> getAll();
}