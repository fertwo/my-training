import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/l10n/app_localizations.dart';
import 'package:mytraining/src/presentation/workouts/all_workouts_page.dart';
import 'package:mytraining/src/ui/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static TextStyle optionStyle = TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const WorkoutsPage(),
    Padding(
      padding: EdgeInsets.all(12.w),
      child: Text(
        'My Stats Page',
        style: optionStyle,
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueSky,
        title: Center(child: Text(AppLocalizations.of(context).my_training_app_name)),
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: AppColors.softBlack,
        elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.accessibility_new),
            label: AppLocalizations.of(context).workouts,
            backgroundColor: AppColors.strongWhite,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.area_chart),
            label: 'My Stats',
            backgroundColor: AppColors.strongWhite
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.strongBlack,
        onTap: _onItemTapped,
      ),
    );
  }
}
