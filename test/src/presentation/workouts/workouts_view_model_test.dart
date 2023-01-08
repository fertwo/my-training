import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/presentation/workouts/workouts_view_model.dart';

import '../../factory/workout_factory.dart';
import '../../mocks/app_mocks.mocks.dart';
import '../../mocks/mock_callback.dart';

main() {
  late WorkoutsViewModel viewModel;
  late MockGetWorkouts getWorkouts;
  late List<Workout> workouts;
  late MockCallback callback;

  setUp(() {
    getWorkouts = MockGetWorkouts();
    viewModel = WorkoutsViewModel(getWorkouts);
    callback = MockCallback();
    workouts = WorkoutFactory.createWorkoutsSet();
    when(getWorkouts())
        .thenAnswer((_) => Future.value(workouts));
  });

  test('load workouts when view is initialized', () {
    viewModel.onViewInitialized();

    verify(getWorkouts()).called(1);
  });

  test('return workouts when request is successful', () {
    fakeAsync((async) {
      viewModel.onViewInitialized();

      async.flushMicrotasks();

      assert(viewModel.workouts == workouts);
    });
  });

  test('notify listeners when request si successful', () {
    fakeAsync((async) {
      viewModel.onViewInitialized();
      viewModel.addListener(callback);

      async.flushMicrotasks();

      verify(callback()).called(1);
    });
  });
}
