import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/src/presentation/workouts/new_workout_page.dart';

class MyWorkoutsPage extends StatefulWidget {
  const MyWorkoutsPage({Key? key}) : super(key: key);

  @override
  State<MyWorkoutsPage> createState() => _MyWorkoutsPageState();
}

class _MyWorkoutsPageState extends State<MyWorkoutsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewWorkoutPage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'My Workouts',
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
