import 'package:collection/collection.dart';
import 'package:mytraining/src/core/entities/session/set_progress.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

class WorkoutSessionExercise {
  final WorkoutExercise workoutExercise;
  late List<SetProgress> _setProgressList;
  double _progress = 0;

  WorkoutSessionExercise(this.workoutExercise) {
    _setProgressList = List<SetProgress>.generate(workoutExercise.sets, (_) {
      return SetProgress(workoutExercise.repetitions);
    });
  }
  
  void completeRepetition() {
    if (isCompleted()) return;

    _setProgressList.firstWhereOrNull((element) => !element.isCompleted())?.completeRepetition();

    var globalProgress = 0.0;
    for (var currentSet in _setProgressList) {
      globalProgress += currentSet.getProgress();
    }
    _progress = globalProgress/ _setProgressList.length;
  }

  bool isCompleted() => _progress == 1.0;

  double getProgress() => _progress;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutSessionExercise &&
          runtimeType == other.runtimeType &&
          workoutExercise == other.workoutExercise;

  @override
  int get hashCode => workoutExercise.hashCode;
}