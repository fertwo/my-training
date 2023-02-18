import 'package:fake_async/fake_async.dart';
import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mytraining/src/core/action/finish_workout_session.dart';
import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/repository/workout_repository.dart';
import 'package:mytraining/src/core/repository/workout_session_repository.dart';
import 'package:mytraining/src/infrastructure/repository/in_memory_workout_session_repository.dart';

import '../../factory/workout_factory.dart';
import '../../mocks/app_mocks.mocks.dart';

main() {
  late WorkoutSession workoutSession;
  late WorkoutSession otherWorkoutSession;
  late FinishWorkoutSession finishWorkout;
  late WorkoutRepository workoutRepository;
  late WorkoutSessionRepository workoutSessionRepository;

  setUp(() {
    workoutSessionRepository = InMemoryWorkoutSessionRepository();
    workoutRepository = MockWorkoutRepository();
    workoutSession =
        WorkoutSession.from(WorkoutFactory.createAWorkout(title: "workout 1"));
    otherWorkoutSession =
        WorkoutSession.from(WorkoutFactory.createAWorkout(title: "workout 2"));
  });

  test('save workout session in repository', () {
    fakeAsync((async) {
      finishWorkout =
          FinishWorkoutSession(workoutRepository, workoutSessionRepository);

      finishWorkout(workoutSession);

      async.flushMicrotasks();

      workoutSessionRepository.getAll().first.shouldBeEqualTo(workoutSession);
    });
  });

  test('save multiple workout sessions in repository', () {
    fakeAsync((async) {
      finishWorkout =
          FinishWorkoutSession(workoutRepository, workoutSessionRepository);

      finishWorkout(workoutSession);
      finishWorkout(otherWorkoutSession);

      async.flushMicrotasks();

      workoutSessionRepository.getAll().length.shouldBeEqualTo(2);
      workoutSessionRepository.getAll()[0].shouldBeEqualTo(workoutSession);
      workoutSessionRepository.getAll()[1].shouldBeEqualTo(otherWorkoutSession);
    });
  });

  test('save workout in repository', () {
    fakeAsync((async) {
      finishWorkout =
          FinishWorkoutSession(workoutRepository, workoutSessionRepository);

      finishWorkout(workoutSession);
      async.flushMicrotasks();

      verify(workoutRepository.save(workoutSession.toWorkout())).called(1);
    });
  });
}
