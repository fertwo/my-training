import 'package:flutter/foundation.dart';

@immutable
class Training {
  final String title;

  Training(this.title) {
    validateTraining();
  }

  void validateTraining() {
    if (title.isEmpty) {
      throw ArgumentError("invalid training, title can not be empty");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Training &&
              runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;
}