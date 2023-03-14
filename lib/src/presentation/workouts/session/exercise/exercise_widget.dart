import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/presentation/workouts/session/exercise/exercise_load_dialog.dart';
import 'package:mytraining/src/presentation/workouts/session/workout_session_view_model.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../ui/app_colors.dart';
import 'exercise_switch.dart';

class ExerciseWidget extends StatelessWidget {
  final WorkoutSessionViewModel _viewModel;
  final WorkoutSessionExercise _sessionExercise;

  const ExerciseWidget(this._viewModel, this._sessionExercise, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //TODO: ir a detalle de ejercicio de la sesion
        },
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.w, right: 8.w, top: 12.h, bottom: 12.h),
          child: Column(
            children: [
              Text(_sessionExercise.name(),
                  style: TextStyle(
                      color: AppColors.workoutSessionTitle,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 25,
                          child: Image.asset(
                              "assets/images/barbell.png",
                              fit: BoxFit.scaleDown,
                              width: 40.w,
                              height: 40.w)),
                      Expanded(
                          flex: 20,
                          child: _buildExerciseInfoWith(
                              _sessionExercise.sets().toString(), AppLocalizations.of(context).sets)),
                      Expanded(
                          flex: 20,
                          child: _buildExerciseInfoWith(
                              _sessionExercise.repetitions().toString(),
                              AppLocalizations.of(context).repetitions)),
                      Expanded(
                            flex: 20,
                            child: GestureDetector(
                                onTap: () {
                                  _showExerciseLoadDialog(context);
                                },
                                child: _buildExerciseInfoWith(
                                "${_sessionExercise.load()}Kg", "${AppLocalizations.of(context).load} +"))
                      ),
                      Expanded(
                          flex: 15,
                          child: ExerciseSwitchWidget(
                              _sessionExercise,
                              () => onExerciseCompleted(_sessionExercise),
                              () => onExerciseRestarted(_sessionExercise)))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildExerciseInfoWith(String value, String info) {
    return Column(
      children: [
        AutoSizeText(value,
            maxLines: 1,
            minFontSize: 10,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: AutoSizeText(info, maxLines: 1, minFontSize: 10,)),
      ],
    );
  }

  void _showExerciseLoadDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => ExerciseLoadDialog(_viewModel, _sessionExercise));
  }

  void onExerciseCompleted(WorkoutSessionExercise exercise) =>
      _viewModel.completeExerciseClicked(exercise);

  void onExerciseRestarted(WorkoutSessionExercise exercise) =>
      _viewModel.restartExerciseClicked(exercise);
}
