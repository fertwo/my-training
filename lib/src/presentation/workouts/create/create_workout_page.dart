import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
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
