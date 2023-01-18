import 'package:flutter/material.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/ui/app_colors.dart';

class ExerciseSwitchWidget extends StatefulWidget {
  final WorkoutSessionExercise workoutSessionExercise;
  final VoidCallback _onExerciseCompleted;
  final VoidCallback _onExerciseRestarted;

  const ExerciseSwitchWidget(this.workoutSessionExercise,
      this._onExerciseCompleted, this._onExerciseRestarted,
      {Key? key})
      : super(key: key);

  @override
  State<ExerciseSwitchWidget> createState() => _ExerciseSwitchWidgetState();
}

class _ExerciseSwitchWidgetState extends State<ExerciseSwitchWidget> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.workoutSessionExercise.isCompleted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSelected,
      activeColor: AppColors.exerciseSwitchColor,
      onChanged: (bool value) {
        setState(() {
          isSelected = value;
          isSelected
              ? widget._onExerciseCompleted()
              : widget._onExerciseRestarted();
        });
      },
    );
  }
}
