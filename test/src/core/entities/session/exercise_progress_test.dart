import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytraining/src/core/entities/session/exercise_progress.dart';
import 'package:mytraining/src/core/entities/session/repetition_status.dart';

main() {
  late ExerciseProgress exerciseProgress;
  const int singleSet = 1;
  const int threeSets = 3;

  test('create exercise progress as pending', () {
    exerciseProgress = ExerciseProgress(singleSet);

    exerciseProgress.setsAmount().shouldBeEqualTo(1);
    exerciseProgress.getSets().first.shouldBeEqualTo(SetStatus.pending);
  });

  test('create all sets progress as pending when exercise has multiple sets',
      () {
    exerciseProgress = ExerciseProgress(threeSets);

    exerciseProgress.setsAmount().shouldBeEqualTo(3);
    for (var currentStatus in exerciseProgress.getSets()) {
      currentStatus.shouldBeEqualTo(SetStatus.pending);
    }
  });

  test('complete a set', () {
    exerciseProgress = ExerciseProgress(singleSet);

    exerciseProgress.completeSet();

    exerciseProgress.getSets().first.shouldBeEqualTo(SetStatus.completed);
  });

  test('complete multiple sets', () {
    exerciseProgress = ExerciseProgress(threeSets);

    exerciseProgress.completeSet();
    exerciseProgress.completeSet();

    exerciseProgress.getSets()[0].shouldBeEqualTo(SetStatus.completed);
    exerciseProgress.getSets()[1].shouldBeEqualTo(SetStatus.completed);
    exerciseProgress.getSets()[2].shouldBeEqualTo(SetStatus.pending);
  });

  test('complete set does nothing if exercise is already completed', () {
    exerciseProgress = ExerciseProgress(threeSets);
    exerciseProgress.completeSet();
    exerciseProgress.completeSet();
    exerciseProgress.completeSet();

    exerciseProgress.completeSet();

    for (var currentStatus in exerciseProgress.getSets()) {
      currentStatus.shouldBeEqualTo(SetStatus.completed);
    }
  });

  test('exercise progress starts as zero', () {
    exerciseProgress = ExerciseProgress(threeSets);

    exerciseProgress.getProgress().shouldBeZero();
  });

  test('advance exercise progress when completes a set', () {
    exerciseProgress = ExerciseProgress(threeSets);

    exerciseProgress.completeSet();

    exerciseProgress.getProgress().shouldBeEqualTo(1 / threeSets);
  });

  test('exercise progress is 1 when completes all sets', () {
    exerciseProgress = ExerciseProgress(threeSets);

    exerciseProgress.completeSet();
    exerciseProgress.completeSet();
    exerciseProgress.completeSet();

    exerciseProgress.getProgress().shouldBeEqualTo(1);
  });

  test('return not completed if there are uncompleted sets', () {
    exerciseProgress = ExerciseProgress(threeSets);

    exerciseProgress.completeSet();
    exerciseProgress.completeSet();

    exerciseProgress.isCompleted().shouldBeFalse();
  });

  test('is completed when all sets are completed', () {
    exerciseProgress = ExerciseProgress(singleSet);

    exerciseProgress.completeSet();

    exerciseProgress.isCompleted().shouldBeTrue();
  });
}
