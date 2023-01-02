import 'package:mytraining/src/core/entities/repetition_status.dart';

class SetProgress {
  double _progress = 0;
  final List<RepetitionStatus> _repetitionStatusList = List.empty(growable: true);

  SetProgress(int repetitions) {
    _createAllRepetitionsAsPending(repetitions);
  }

  List<RepetitionStatus> getRepetitions() => List.unmodifiable(_repetitionStatusList);

  int repetitionsAmount() => _repetitionStatusList.length;

  double getProgress() => _progress;

  bool isCompleted() => _repetitionStatusList.every((element) => element == RepetitionStatus.completed);

  void completeRepetition() {
    final firstPendingIndex = _repetitionStatusList.indexWhere((element) => element == RepetitionStatus.pending);
    if (_isAValidIndex(firstPendingIndex)) {
      _repetitionStatusList[firstPendingIndex] = RepetitionStatus.completed;
    }

    _progress = _repetitionStatusList.where((element) => element == RepetitionStatus.completed).length / _repetitionStatusList.length;
  }

  bool _isAValidIndex(int firstPendingIndex) => firstPendingIndex >= 0;

  void _createAllRepetitionsAsPending(int repetitions) {
    int i = 1;
    do {
      _repetitionStatusList.add(RepetitionStatus.pending);
      i++;
    } while (i <= repetitions);
  }
}