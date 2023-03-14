import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';
import 'package:mytraining/src/infrastructure/repository/stub_workout_repository.dart';

main() {
  late StubWorkoutRepository repository;
  final newWorkout = Workout(21, "Legs workout", [
    WorkoutExercise(ExerciseName.horizontalLegPress, ExerciseType.legs, 3, 12, 39),
    WorkoutExercise(ExerciseName.benchPress, ExerciseType.legs, 4, 8, 41),
    WorkoutExercise(ExerciseName.bicycleCrunch, ExerciseType.legs, 4, 8, 23),
    WorkoutExercise(ExerciseName.legExtension, ExerciseType.legs, 4, 8, 43),
    WorkoutExercise(ExerciseName.plank, ExerciseType.legs, 4, 8, 0),
  ]);

  final editedWorkout = Workout(21, "Low body workout", [
    WorkoutExercise(ExerciseName.horizontalLegPress, ExerciseType.legs, 3, 12, 2),
    WorkoutExercise(ExerciseName.benchPress, ExerciseType.legs, 4, 8, 11),
    WorkoutExercise(ExerciseName.bicycleCrunch, ExerciseType.legs, 4, 8, 22),
    WorkoutExercise(ExerciseName.legExtension, ExerciseType.legs, 4, 8, 3),
    WorkoutExercise(ExerciseName.plank, ExerciseType.legs, 4, 8, 0),
  ]);

  setUp(() {
    repository = StubWorkoutRepository();
  });

  test('start with initial content', () {
    repository.getAll().length.shouldBeEqualTo(3);
  });

  test('save new exercise', () {
    repository.save(newWorkout);

    repository.getAll().length.shouldBeEqualTo(4);
  });

  test('update exercise', () {
    repository.save(newWorkout);

    repository.save(editedWorkout);

    repository.getAll().length.shouldBeEqualTo(4);
    repository.getAll()[3].shouldBeEqualTo(editedWorkout);
  });
}
