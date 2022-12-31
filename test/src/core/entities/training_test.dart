import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/training.dart';

main() {
  late Training training;
  const aValidTitle = "A Training Title";
  const anEmptyTitle = "";

  test('create a valid training', () {
    training = Training(aValidTitle);

    assert(training.title == aValidTitle);
  });

  test('can not create a training with no title', () {
    try {
      training = Training(anEmptyTitle);
      assert(false);
    } catch (error) {
      assert(error is ArgumentError);
    }
  });
}