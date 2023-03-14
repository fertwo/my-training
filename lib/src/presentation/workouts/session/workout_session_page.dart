import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/l10n/app_localizations.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/infrastructure/factory/actions_factory.dart';
import 'package:mytraining/src/presentation/home/home_page.dart';
import 'package:mytraining/src/presentation/workouts/session/exercise/exercise_widget.dart';
import 'package:mytraining/src/presentation/workouts/session/workout_session_view_model.dart';
import 'package:provider/provider.dart';

import '../../../ui/app_colors.dart';

class WorkoutSessionPage extends StatefulWidget {
  final Workout _workout;

  const WorkoutSessionPage(this._workout, {Key? key}) : super(key: key);

  @override
  State<WorkoutSessionPage> createState() => _WorkoutSessionPageState();
}

class _WorkoutSessionPageState extends State<WorkoutSessionPage> {
  late WorkoutSessionViewModel _workoutSessionViewModel;

  @override
  void initState() {
    _workoutSessionViewModel = WorkoutSessionViewModel(() {
      _showSessionFinishedDialog();
    }, ActionsFactory.createFinishWorkoutSession());
    _workoutSessionViewModel.onViewInitialized(widget._workout);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        body: SafeArea(
          child: ChangeNotifierProvider.value(
              value: _workoutSessionViewModel, child: _buildExercisesList()),
        ));
  }

  Widget _buildExercisesList() {
    return Consumer<WorkoutSessionViewModel>(
        builder: (BuildContext context, viewModel, Widget? child) {
      return ListView.builder(
          itemCount: widget._workout.exercises.length,
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
              child: ExerciseWidget(viewModel,
                  viewModel.workoutSession.sessionExercises.toList()[index]),
            );
          });
    });
  }

  void _showSessionFinishedDialog() {
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text(AppLocalizations.of(context).congratulations, style: const TextStyle(color: AppColors.mainBackgroundColor, fontWeight: FontWeight.bold)),
                content: Text(AppLocalizations.of(context).workout_finished, style: const TextStyle(color: AppColors.mainBackgroundColor)),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => _closePage(context),
                    child: const Text('OK', style: TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ));
  }

  void _closePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return const HomePage();
    }), (r) {
      return false;
    });
  }
}
