import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mytraining/src/core/entities/session/workout_session_exercise.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/infrastructure/factory/actions_factory.dart';
import 'package:mytraining/src/presentation/workouts/all_workouts_page.dart';
import 'package:mytraining/src/presentation/workouts/session/exercise_switch.dart';
import 'package:mytraining/src/presentation/workouts/session/workout_session_view_model.dart';
import 'package:mytraining/src/ui/app_colors.dart';
import 'package:provider/provider.dart';

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
        body: ChangeNotifierProvider.value(
            value: _workoutSessionViewModel, child: _buildExercisesList()));
  }

  Widget _buildExercisesList() {
    return Consumer<WorkoutSessionViewModel>(
        builder: (BuildContext context, viewModel, Widget? child) {
      return ListView.builder(
          itemCount: widget._workout.exercises.length,
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) {
            return Container(
                child: _buildExerciseCard(
                    viewModel.workoutSession.sessionExercises.toList()[index]));
          });
    });
  }

  Card _buildExerciseCard(WorkoutSessionExercise workoutSessionExercise) {
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
              Text(workoutSessionExercise.name(),
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
                          child: Lottie.asset(
                              "assets/lottie/workout_animation_example.json",
                              width: 60.w)),
                      Expanded(
                          flex: 20,
                          child: _buildExerciseInfoWith(
                              workoutSessionExercise.sets().toString(),
                              "[Sets]")),
                      Expanded(
                          flex: 20,
                          child: _buildExerciseInfoWith(
                              workoutSessionExercise.repetitions().toString(),
                              "[Repetitions]")),
                      Expanded(
                          flex: 20,
                          child: _buildExerciseInfoWith(
                              workoutSessionExercise.load(), "[Load]")),
                      Expanded(
                          flex: 15,
                          child: ExerciseSwitchWidget(
                              workoutSessionExercise,
                              () => onExerciseCompleted(workoutSessionExercise),
                              () =>
                                  onExerciseRestarted(workoutSessionExercise)))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onExerciseCompleted(WorkoutSessionExercise exercise) =>
      _workoutSessionViewModel.completeExerciseClicked(exercise);

  void onExerciseRestarted(WorkoutSessionExercise exercise) =>
      _workoutSessionViewModel.restartExerciseClicked(exercise);

  Column _buildExerciseInfoWith(String value, String info) {
    return Column(
      children: [
        AutoSizeText(value,
            maxLines: 1,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: AutoSizeText(info, maxLines: 1)),
      ],
    );
  }

  void _showSessionFinishedDialog() {
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
                title: const Text('[Congratulations]'),
                content: const Text('[Workout finished!!]'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => _closePage(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
        ));
  }

  void _closePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return const WorkoutsPage();
    }), (r) {
      return false;
    });
  }
}
