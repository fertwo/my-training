import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/entities/exercise_type.dart';

@immutable
class Exercise {
  final String name;
  final ExerciseType type;

  Exercise(this.name, this.type) {
    validateExercise();
  }

  void validateExercise() {
    if (name.isEmpty) {
      throw ArgumentError("invalid exercise, name can not be empty");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Exercise &&
              runtimeType == other.runtimeType &&
              name == other.name && type == other.type;

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}