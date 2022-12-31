import 'package:flutter/foundation.dart';

@immutable
class Workout {
  final String title;

  Workout(this.title) {
    validateWorkout();
  }

  void validateWorkout() {
    if (title.isEmpty) {
      throw ArgumentError("invalid workout, title can not be empty");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Workout &&
              runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;
}