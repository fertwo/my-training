// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mytraining/l10n/app_localizations_en.dart';
import 'package:mytraining/l10n/app_localizations_es.dart';

abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
  <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  String get my_training_app_name;
  String get sets;
  String get repetitions;
  String get load;
  String get update_load;
  String get set_desired_load;
  String get cancel;
  String get save;
  String get congratulations;
  String get workout_finished;
  String get exercises;
  String get muscles;
  String get abdomen;
  String get arms;
  String get back;
  String get cardio;
  String get chest;
  String get core;
  String get fullBody;
  String get legs;
  String get olympic;
  String get shoulders;
  String get workouts;
  String get arnoldPress;
  String get backExtension;
  String get benchPress;
  String get bicepCurlDumbbell;
  String get bicycleCrunch;
  String get chestDip;
  String get chestFly;
  String get chestPress;
  String get crunch;
  String get gobletSquatWithKettlebell;
  String get hammerCurl;
  String get horizontalLegPress;
  String get inclineBenchPressWithDumbbell;
  String get latPullDownWideGripWithCable;
  String get lyingLegCurl;
  String get legExtension;
  String get legPress45Degrees;
  String get overheadPressWithDumbbell;
  String get plank;
  String get pushUp;
  String get seatedLegPress;
  String get standingCalfRaise;
  String get splitSquatWithKettlebell;
  String get tricepsExtensionWithDumbbell;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'en',
    'es'
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
          'an issue with the localizations generation tool. Please file an issue '
          'on GitHub with a reproducible sample app and the gen-l10n configuration '
          'that was used.');
}
