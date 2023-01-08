import 'package:mytraining/src/core/entities/session/repetition_status.dart';

class ExerciseProgress {
  List<SetStatus> _setStatusList = List.empty(growable: true);

  ExerciseProgress(int sets) {
    _createAllSetsAsPending(sets);
  }

  List<SetStatus> getSets() => List.unmodifiable(_setStatusList);

  int setsAmount() => _setStatusList.length;

  double getProgress() => _setStatusList.where((element) => element == SetStatus.completed).length / _setStatusList.length;

  bool isCompleted() => _setStatusList.every((element) => element == SetStatus.completed);

  void completeSet() {
    final firstPendingIndex = _setStatusList.indexWhere((element) => element == SetStatus.pending);
    if (_isAValidIndex(firstPendingIndex)) {
      _setStatusList[firstPendingIndex] = SetStatus.completed;
    }
  }

  void complete() {
    _setStatusList = _setStatusList.map((e) => e = SetStatus.completed).toList();
  }

  bool _isAValidIndex(int firstPendingIndex) => firstPendingIndex >= 0;

  void _createAllSetsAsPending(int sets) {
    int i = 1;
    do {
      _setStatusList.add(SetStatus.pending);
      i++;
    } while (i <= sets);
  }
}