import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/repetition_status.dart';
import 'package:mytraining/src/core/entities/session/set_progress.dart';

main() {
  late SetProgress setProgress;
  const int singleRepetition = 1;
  const int threeRepetitions = 3;

  test('create repetition progress as pending', () {
    setProgress = SetProgress(singleRepetition);

    setProgress.repetitionsAmount().shouldBeEqualTo(1);
    setProgress.getRepetitions().first.shouldBeEqualTo(RepetitionStatus.pending);
  });

  test(
      'create all repetitions progress as pending when set has multiple repetitions',
      () {
    setProgress = SetProgress(threeRepetitions);

    setProgress.repetitionsAmount().shouldBeEqualTo(3);
    for (var currentStatus in setProgress.getRepetitions()) {
      currentStatus.shouldBeEqualTo(RepetitionStatus.pending);
    }
  });

  test('complete repetition', () {
    setProgress = SetProgress(singleRepetition);

    setProgress.completeRepetition();

    setProgress.getRepetitions().first
        .shouldBeEqualTo(RepetitionStatus.completed);
  });

  test('complete multiple repetitions', () {
    setProgress = SetProgress(threeRepetitions);

    setProgress.completeRepetition();
    setProgress.completeRepetition();

    setProgress.getRepetitions()[0]
        .shouldBeEqualTo(RepetitionStatus.completed);
    setProgress.getRepetitions()[1]
        .shouldBeEqualTo(RepetitionStatus.completed);
    setProgress.getRepetitions()[2]
        .shouldBeEqualTo(RepetitionStatus.pending);
  });

  test('complete repetition does nothing if set is already completed', () {
    setProgress = SetProgress(threeRepetitions);
    setProgress.completeRepetition();
    setProgress.completeRepetition();
    setProgress.completeRepetition();

    setProgress.completeRepetition();

    for (var currentStatus in setProgress.getRepetitions()) {
      currentStatus.shouldBeEqualTo(RepetitionStatus.completed);
    }
  });

  test('set progress starts as zero', () {
    setProgress = SetProgress(threeRepetitions);

    setProgress.getProgress().shouldBeZero();
  });

  test('advance set progress when completes a repetition', () {
    setProgress = SetProgress(threeRepetitions);

    setProgress.completeRepetition();

    setProgress.getProgress().shouldBeEqualTo(1 / threeRepetitions);
  });

  test('set progress is 1 when completes all repetitions', () {
    setProgress = SetProgress(threeRepetitions);

    setProgress.completeRepetition();
    setProgress.completeRepetition();
    setProgress.completeRepetition();

    setProgress.getProgress().shouldBeEqualTo(1);
  });

  test('return not completed if there are uncompleted repetitions', () {
    setProgress = SetProgress(threeRepetitions);

    setProgress.completeRepetition();
    setProgress.completeRepetition();

    setProgress.isCompleted().shouldBeFalse();
  });

  test('is completed when all repetitions are completed', () {
    setProgress = SetProgress(singleRepetition);

    setProgress.completeRepetition();

    setProgress.isCompleted().shouldBeTrue();
  });
}
