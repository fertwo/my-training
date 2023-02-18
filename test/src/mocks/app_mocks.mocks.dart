// Mocks generated by Mockito 5.3.2 from annotations
// in mytraining/test/src/mocks/app_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mytraining/src/core/action/finish_workout_session.dart' as _i7;
import 'package:mytraining/src/core/action/get_workouts.dart' as _i4;
import 'package:mytraining/src/core/entities/session/workout_session.dart'
    as _i8;
import 'package:mytraining/src/core/entities/workout/workout.dart' as _i6;
import 'package:mytraining/src/core/repository/workout_repository.dart' as _i2;
import 'package:mytraining/src/core/repository/workout_session_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWorkoutRepository_0 extends _i1.SmartFake
    implements _i2.WorkoutRepository {
  _FakeWorkoutRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWorkoutSessionRepository_1 extends _i1.SmartFake
    implements _i3.WorkoutSessionRepository {
  _FakeWorkoutSessionRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetWorkouts].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWorkouts extends _i1.Mock implements _i4.GetWorkouts {
  MockGetWorkouts() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WorkoutRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeWorkoutRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.WorkoutRepository);
  @override
  _i5.Future<List<_i6.Workout>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<List<_i6.Workout>>.value(<_i6.Workout>[]),
      ) as _i5.Future<List<_i6.Workout>>);
}

/// A class which mocks [FinishWorkoutSession].
///
/// See the documentation for Mockito's code generation for more information.
class MockFinishWorkoutSession extends _i1.Mock
    implements _i7.FinishWorkoutSession {
  MockFinishWorkoutSession() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.WorkoutSessionRepository get workoutSessionRepository =>
      (super.noSuchMethod(
        Invocation.getter(#workoutSessionRepository),
        returnValue: _FakeWorkoutSessionRepository_1(
          this,
          Invocation.getter(#workoutSessionRepository),
        ),
      ) as _i3.WorkoutSessionRepository);
  @override
  _i2.WorkoutRepository get workoutRepository => (super.noSuchMethod(
        Invocation.getter(#workoutRepository),
        returnValue: _FakeWorkoutRepository_0(
          this,
          Invocation.getter(#workoutRepository),
        ),
      ) as _i2.WorkoutRepository);
  @override
  void call(_i8.WorkoutSession? workoutSession) => super.noSuchMethod(
        Invocation.method(
          #call,
          [workoutSession],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [WorkoutRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWorkoutRepository extends _i1.Mock implements _i2.WorkoutRepository {
  MockWorkoutRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void save(_i6.Workout? workout) => super.noSuchMethod(
        Invocation.method(
          #save,
          [workout],
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i6.Workout> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: <_i6.Workout>[],
      ) as List<_i6.Workout>);
}
