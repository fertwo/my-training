import 'package:mytraining/src/core/entities/workout/workout.dart';

import '../../core/entities/exercise/exercise_name.dart';
import '../../core/entities/exercise/exercise_type.dart';
import '../../core/entities/workout/workout_exercise.dart';
import '../../core/repository/workout_repository.dart';

class StubWorkoutRepository implements WorkoutRepository {
  final workouts = [
    Workout(1, "Inferior", [
      WorkoutExercise(ExerciseName.backExtension, ExerciseType.back, 1, 10, 0),
      WorkoutExercise(ExerciseName.seatedLegPress, ExerciseType.legs, 4, 10, 59),
      WorkoutExercise(ExerciseName.splitSquatWithKettlebell, ExerciseType.legs, 4, 10, 10),
      WorkoutExercise(ExerciseName.gobletSquatWithKettlebell, ExerciseType.legs, 4, 10, 16),
      WorkoutExercise(ExerciseName.lyingLegCurl, ExerciseType.legs, 3, 10, 29),
      WorkoutExercise(ExerciseName.legExtension, ExerciseType.legs, 4, 10, 59),
      WorkoutExercise(ExerciseName.standingCalfRaise, ExerciseType.legs, 3, 12, 0)
    ]),
    Workout(2, "Superior", [
      WorkoutExercise(ExerciseName.pushUp, ExerciseType.chest, 3, 12, 0),
      WorkoutExercise(ExerciseName.overheadPressWithDumbbell, ExerciseType.shoulders, 4, 10, 9),
      WorkoutExercise(ExerciseName.chestPress, ExerciseType.chest, 3, 10, 45),
      WorkoutExercise(ExerciseName.latPullDownWideGripWithCable, ExerciseType.back, 4, 10, 41),
      WorkoutExercise(ExerciseName.inclineBenchPressWithDumbbell, ExerciseType.chest, 5, 10, 12),
      WorkoutExercise(ExerciseName.chestFly, ExerciseType.chest, 4, 10, 41),
      WorkoutExercise(ExerciseName.tricepsExtensionWithDumbbell, ExerciseType.arms, 4, 12, 15),
      WorkoutExercise(ExerciseName.bicepCurlDumbbell, ExerciseType.arms, 3, 10, 6),
      WorkoutExercise(ExerciseName.hammerCurl, ExerciseType.arms, 3, 8, 6),
    ]),
    Workout(3, "Mixto", [
      WorkoutExercise(ExerciseName.seatedLegPress, ExerciseType.legs, 4, 10, 59),
      WorkoutExercise(ExerciseName.gobletSquatWithKettlebell, ExerciseType.legs, 4, 10, 16),
      WorkoutExercise(ExerciseName.lyingLegCurl, ExerciseType.legs, 3, 10, 29),
      WorkoutExercise(ExerciseName.inclineBenchPressWithDumbbell, ExerciseType.chest, 4, 10, 12),
      WorkoutExercise(ExerciseName.latPullDownWideGripWithCable, ExerciseType.back, 4, 10, 41),
      WorkoutExercise(ExerciseName.chestPress, ExerciseType.chest, 3, 10, 45),
      WorkoutExercise(ExerciseName.overheadPressWithDumbbell, ExerciseType.shoulders, 4, 10, 9),
      WorkoutExercise(ExerciseName.tricepsExtensionWithDumbbell, ExerciseType.arms, 4, 12, 15),
      WorkoutExercise(ExerciseName.bicepCurlDumbbell, ExerciseType.arms, 3, 10, 6),
      WorkoutExercise(ExerciseName.hammerCurl, ExerciseType.arms, 3, 8, 6),
    ])
  ];

  @override
  List<Workout> getAll() {
    return workouts;
  }

  @override
  void save(Workout workout) {
    for (int i = 0; i < workouts.length; i++){
      if (workouts[i].id == workout.id){
        workouts[i] = workout;
        return;
      }
    }
    workouts.add(workout);
  }
}
