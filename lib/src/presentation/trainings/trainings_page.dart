import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/src/presentation/trainings/new_training_page.dart';

class MyTrainingsPage extends StatefulWidget {
  const MyTrainingsPage({Key? key}) : super(key: key);

  @override
  State<MyTrainingsPage> createState() => _MyTrainingsPageState();
}

class _MyTrainingsPageState extends State<MyTrainingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewTrainingPage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'My Trainings',
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
