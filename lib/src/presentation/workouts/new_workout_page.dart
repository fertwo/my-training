import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewWorkoutPage extends StatefulWidget {
  const NewWorkoutPage({Key? key}) : super(key: key);

  @override
  State<NewWorkoutPage> createState() => _NewWorkoutPageState();
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Text(
            'Create New Workout',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)
          ),
      ),
    );
  }
}
