import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/l10n/app_localizations.dart';
import 'package:mytraining/src/core/entities/workout/workout.dart';
import 'package:mytraining/src/infrastructure/factory/actions_factory.dart';
import 'package:mytraining/src/presentation/formatter/workout_formatter.dart';
import 'package:mytraining/src/presentation/workouts/create/create_workout_page.dart';
import 'package:mytraining/src/presentation/workouts/session/workout_session_page.dart';
import 'package:mytraining/src/presentation/workouts/workouts_view_model.dart';
import 'package:mytraining/src/ui/app_colors.dart';
import 'package:provider/provider.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  late WorkoutsViewModel _workoutsViewModel;

  @override
  void initState() {
    _workoutsViewModel = WorkoutsViewModel(ActionsFactory.createGetWorkouts());
    _workoutsViewModel.onViewInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.softWhite,
        floatingActionButton: _buildFloatingActionButton(context),
        body: ChangeNotifierProvider.value(
            value: _workoutsViewModel,
            child: Consumer<WorkoutsViewModel>(
                builder: (BuildContext context, viewModel, Widget? child) {
              return _buildWorkoutsList();
            })));
  }

  ListView _buildWorkoutsList() {
    return ListView.builder(
        itemCount: _workoutsViewModel.workouts.length,
        addAutomaticKeepAlives: false,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
            child: _buildWorkoutCard(_workoutsViewModel.workouts[index]),
          );
        });
  }

  Card _buildWorkoutCard(Workout workout) {
    return Card(
      color: AppColors.strongWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        splashColor: Colors.grey,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WorkoutSessionPage(workout),
            ),
          );
        },
        child: Padding(
          padding:
              EdgeInsets.only(left: 18.w, right: 18.w, top: 12.h, bottom: 12.h),
          child: Column(
            children: [
              Text(workout.title,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.blueSky)),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: Row(
                  children: [
                    Column(children: [
                      Text("${workout.exercises.length}",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.blueSky)),
                      Text(AppLocalizations.of(context).exercises,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.blueSky))
                    ]),
                    Expanded(
                        child: Column(
                      children: [
                        Text(AppLocalizations.of(context).muscles,
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold, color: AppColors.blueSky)),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(WorkoutFormatter.getExerciseTypesFrom(
                              workout, AppLocalizations.of(context)), style: const TextStyle(color: AppColors.softBlack)),
                        )
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreateWorkoutPage(),
          ),
        );
      },
      backgroundColor: AppColors.blueSky,
      foregroundColor: AppColors.softWhite,
      child: const Icon(Icons.add),
    );
  }
}
