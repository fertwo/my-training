import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTrainingPage extends StatefulWidget {
  const NewTrainingPage({Key? key}) : super(key: key);

  @override
  State<NewTrainingPage> createState() => _NewTrainingPageState();
}

class _NewTrainingPageState extends State<NewTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Text(
            'Create New Training',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)
          ),
      ),
    );
  }
}
