import 'package:flutter/foundation.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_type.dart';

@immutable
class Exercise {
  final ExerciseName name;
  final ExerciseType type;

  const Exercise(this.name, this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Exercise &&
              runtimeType == other.runtimeType &&
              name == other.name && type == other.type;

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}