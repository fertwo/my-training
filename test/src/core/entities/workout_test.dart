import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/workout.dart';

main() {
  late Workout workout;
  const aValidTitle = "A Workout Title";
  const anEmptyTitle = "";

  test('create a valid workout', () {
    workout = Workout(aValidTitle);

    assert(workout.title == aValidTitle);
  });

  test('can not create a workout with no title', () {
    try {
      workout = Workout(anEmptyTitle);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });
}