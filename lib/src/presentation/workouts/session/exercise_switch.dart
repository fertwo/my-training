import 'package:flutter/material.dart';
import 'package:mytraining/src/ui/app_colors.dart';

class ExerciseSwitchWidget extends StatefulWidget {
  const ExerciseSwitchWidget({Key? key}) : super(key: key);

  @override
  State<ExerciseSwitchWidget> createState() => _ExerciseSwitchWidgetState();
}

class _ExerciseSwitchWidgetState extends State<ExerciseSwitchWidget> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSelected,
      activeColor: AppColors.exerciseSwitchColor,
      onChanged: (bool value) {
        setState(() {
          isSelected = value;
        });
      },
    );
  }
}
