import 'package:mytraining/src/core/entities/session/exercise_progress.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

class WorkoutSessionExercise {
  final WorkoutExercise _workoutExercise;
  late ExerciseProgress _exerciseProgress;

  WorkoutSessionExercise(this._workoutExercise) {
    _exerciseProgress = ExerciseProgress(_workoutExercise.sets);
  }

  String name() => _workoutExercise.name.name;

  int repetitions() => _workoutExercise.repetitions;

  int sets() => _workoutExercise.sets;

  int load() => _workoutExercise.load;

  void completeSet() {
    if (isCompleted()) return;
    _exerciseProgress.completeSet();
  }

  bool isCompleted() => _exerciseProgress.isCompleted();

  double getProgress() => _exerciseProgress.getProgress();

  void updateLoad(int newLoad) {
    _workoutExercise.updateLoad(newLoad);
  }

  void complete() {
    _exerciseProgress.complete();
  }

  void restart() {
    _exerciseProgress.restart();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutSessionExercise &&
          runtimeType == other.runtimeType &&
          _workoutExercise == other._workoutExercise;

  @override
  int get hashCode => _workoutExercise.hashCode;
}