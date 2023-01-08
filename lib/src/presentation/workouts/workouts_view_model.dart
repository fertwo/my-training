import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/action/get_workouts.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';

class WorkoutsViewModel with ChangeNotifier {
  final GetWorkouts _getWorkouts;
  late List<Workout> _workouts = [];
  List<Workout> get workouts => _workouts;

  WorkoutsViewModel(this._getWorkouts);

  void onViewInitialized() {
    _getWorkouts().then((workouts) => _onWorkoutsObtained(workouts));//TODO: Manejo de errores
  }

  void _onWorkoutsObtained(List<Workout> workouts) {
    _workouts = workouts;
    notifyListeners();
  }
}