import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/ui/app_colors.dart';

import '../../../../../l10n/app_localizations.dart';
import '../workout_session_view_model.dart';

class ExerciseLoadDialog extends StatefulWidget {
  final WorkoutSessionViewModel _viewModel;
  final WorkoutSessionExercise _sessionExercise;

  const ExerciseLoadDialog(this._viewModel, this._sessionExercise, {Key? key})
      : super(key: key);

  @override
  State<ExerciseLoadDialog> createState() => _ExerciseLoadDialogState();
}

class _ExerciseLoadDialogState extends State<ExerciseLoadDialog> {
  final _loadTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          widget._sessionExercise.name(), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.blueSky)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(AppLocalizations.of(context).set_desired_load)),
          SizedBox(height: 18.h),
          TextField(
            controller: _loadTextController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'\d')),
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '${AppLocalizations.of(context).load} (KG)',
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => {_closeDialog(context)},
          child: Text(AppLocalizations.of(context).cancel, style: const TextStyle(color: AppColors.softBlack, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () {
            widget._viewModel.onNewLoadAdded(
                widget._sessionExercise, int.parse(_loadTextController.text));
            _closeDialog(context);
          },
          child: Text(AppLocalizations.of(context).save, style: const TextStyle(color: AppColors.blueSky, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  void _closeDialog(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop('dialog');

  @override
  void dispose() {
    _loadTextController.dispose();
    super.dispose();
  }
}
