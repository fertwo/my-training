import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';
import 'package:mytraining/src/core/entities/session/workout_session.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/core/entities/workout/workout_exercise.dart';

class WorkoutSessionViewModel with ChangeNotifier {
  final VoidCallback _onSessionFinishedCallback;

  WorkoutSessionViewModel(this._onSessionFinishedCallback);

  WorkoutSession _workoutSession = WorkoutSession.from(Workout("test", [
    WorkoutExercise(ExerciseName.plank, ExerciseType.abdomen, 4, 8, "41kg")
  ]));

  WorkoutSession get workoutSession => _workoutSession;

  //TODO: el workout se obtiene de un repositorio y en la vista se manejan views
  void onViewInitialized(Workout workout) {
    _workoutSession = WorkoutSession.from(workout);
    notifyListeners();
  }

  void completeExercise(WorkoutSessionExercise exercise) {
    _workoutSession.completeExercise(exercise);
    notifyIfSessionIsFinished();
  }

  void notifyIfSessionIsFinished() {
    if (_workoutSession.isCompleted()) {
      _onSessionFinishedCallback();
    }
  }

  void restartExercise(WorkoutSessionExercise exercise) {
    _workoutSession.restartExercise(exercise);
  }
}
