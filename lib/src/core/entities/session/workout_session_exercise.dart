import 'package:collection/collection.dart';
import 'package:mytraining/src/core/entities/session/set_progress.dart';
import 'package:mytraining/src/core/entities/workout_exercise.dart';

class WorkoutSessionExercise {
  final WorkoutExercise workoutExercise;
  final List<SetProgress> _setProgressList;
  double _progress = 0;

  WorkoutSessionExercise(this.workoutExercise, this._setProgressList);
  
  void completeRepetition() {
    _setProgressList.firstWhereOrNull((element) => !element.isCompleted())?.completeRepetition();

    var globalProgress = 0.0;
    for (var currentSet in _setProgressList) {
      globalProgress += currentSet.getProgress();
    }
    _progress = globalProgress/ _setProgressList.length;
  }

  double getProgress() => _progress;
}