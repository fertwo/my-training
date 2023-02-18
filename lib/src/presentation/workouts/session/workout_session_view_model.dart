import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/action/finish_workout_session.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

class WorkoutSessionViewModel with ChangeNotifier {
  final VoidCallback _onSessionFinishedCallback;
  final FinishWorkoutSession _finishWorkoutSession;

  WorkoutSessionViewModel(this._onSessionFinishedCallback, this._finishWorkoutSession);

  WorkoutSession _workoutSession = WorkoutSession.from(Workout(1, "test", [
    WorkoutExercise(ExerciseName.plank, ExerciseType.abdomen, 4, 8, 41)
  ]));

  WorkoutSession get workoutSession => _workoutSession;

  //TODO: el workout se obtiene de un repositorio y en la vista se manejan views
  void onViewInitialized(Workout workout) {
    _workoutSession = WorkoutSession.from(workout);
    notifyListeners();
  }

  void completeExerciseClicked(WorkoutSessionExercise exercise) {
    _workoutSession.completeExercise(exercise);
    _notifyIfSessionIsFinished();
  }

  void restartExerciseClicked(WorkoutSessionExercise exercise) {
    _workoutSession.restartExercise(exercise);
  }

  void _notifyIfSessionIsFinished() {
    if (_workoutSession.isCompleted()) {
      _onSessionFinishedCallback();
      _finishWorkoutSession.call(workoutSession);
    }
  }

  void onNewLoadAdded(WorkoutSessionExercise exercise, int newLoad) {
    exercise.updateLoad(newLoad);
    notifyListeners();
  }
}
