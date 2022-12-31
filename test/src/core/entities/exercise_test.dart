import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/exercise.dart';
import 'package:mytraining/src/core/entities/exercise_type.dart';

main() {
  late Exercise exercise;
  const aValidName = "An Exercise name";
  const anEmptyName = "";

  test('create a valid exercise', () {
    exercise = Exercise(aValidName, ExerciseType.core);

    assert(exercise.name == aValidName);
    assert(exercise.type == ExerciseType.core);
  });

  test('can not create an exercise with no name', () {
    try {
      exercise = Exercise(anEmptyName, ExerciseType.cardio);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });
}
