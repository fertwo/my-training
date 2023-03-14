import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise/exercise.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';

main() {
  late Exercise exercise;
  const exerciseName = ExerciseName.horizontalLegPress;

  test('create a valid exercise', () {
    exercise = Exercise(exerciseName, ExerciseType.core);

    assert(exercise.name == exerciseName);
    assert(exercise.type == ExerciseType.core);
  });
}
