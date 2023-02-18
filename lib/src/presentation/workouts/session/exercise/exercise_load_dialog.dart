import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';

import '../workout_session_view_model.dart';

class ExerciseLoadDialog extends StatefulWidget {
  final WorkoutSessionViewModel _viewModel;
  final WorkoutSessionExercise _sessionExercise;

  const ExerciseLoadDialog(this._viewModel, this._sessionExercise,
      {Key? key}) : super(key: key);

  @override
  State<ExerciseLoadDialog> createState() => _ExerciseLoadDialogState();
}

class _ExerciseLoadDialogState extends State<ExerciseLoadDialog> {
  final _loadTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('[${widget._sessionExercise.name()}: Update load]'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(alignment: Alignment.centerLeft,
                child: Text('[Set desired load for exercise]')),
            SizedBox(height: 18.h),
            TextField(
              controller: _loadTextController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Load (KG)',
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => {},
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              widget._viewModel.onNewLoadAdded(widget._sessionExercise, int.parse(_loadTextController.text));
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loadTextController.dispose();
    super.dispose();
  }
}
