import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

class GetWorkouts {
  //TODO: Tests e implementacion real
  Future<List<Workout>> call() {
    return Future.value([
      Workout(1, "Simple workout", [
        WorkoutExercise(
            ExerciseName.legPress, ExerciseType.legs, 3, 12, 39),
        WorkoutExercise(ExerciseName.chestFly, ExerciseType.chest, 4, 8, 41),
        WorkoutExercise(ExerciseName.plank, ExerciseType.abdomen, 4, 8, 41)
      ]),
      Workout(2, "Legs workout", [
        WorkoutExercise(
            ExerciseName.legPress, ExerciseType.legs, 3, 12, 39),
        WorkoutExercise(
            ExerciseName.benchPress, ExerciseType.legs, 4, 8, 41),
        WorkoutExercise(
            ExerciseName.bicycleCrunch, ExerciseType.legs, 4, 8, 23),
        WorkoutExercise(
            ExerciseName.legExtension, ExerciseType.legs, 4, 8, 43),
        WorkoutExercise(
            ExerciseName.plank, ExerciseType.legs, 4, 8, 0),
      ])
    ]);
  }
}
