import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytraining/l10n/app_localizations.dart';
import 'package:mytraining/src/presentation/home/home_page.dart';
import 'package:mytraining/src/ui/app_primary_material_color.dart';

void main() {
  runApp(const MyTrainingApplication());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyTrainingApplication extends StatelessWidget {
  const MyTrainingApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812), //IphoneX resolution in pts
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: MaterialColor(0xff737170, AppMaterialColors.primaryColor),
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).my_training_app_name,
            supportedLocales: const [Locale('en', ''), Locale('es', '')],
            home: const HomePage(),
          );
        });
  }
}
