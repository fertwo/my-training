import 'package:flutter/cupertino.dart';
import 'package:mytraining/l10n/app_localizations.dart';
import 'package:mytraining/src/core/entities/exercise/exercise_name.dart';

class ExerciseNameMapper {
  static String getNameFor(ExerciseName exerciseName, BuildContext context) {
    switch (exerciseName) {
      case ExerciseName.arnoldPress:
        return AppLocalizations.of(context).arnoldPress;
      case ExerciseName.backExtension:
        return AppLocalizations.of(context).backExtension;
      case ExerciseName.benchPress:
        return AppLocalizations.of(context).benchPress;
      case ExerciseName.bicepCurlDumbbell:
        return AppLocalizations.of(context).bicepCurlDumbbell;
      case ExerciseName.bicycleCrunch:
        return AppLocalizations.of(context).bicycleCrunch;
      case ExerciseName.chestDip:
        return AppLocalizations.of(context).chestDip;
      case ExerciseName.chestFly:
        return AppLocalizations.of(context).chestFly;
      case ExerciseName.chestPress:
        return AppLocalizations.of(context).chestPress;
      case ExerciseName.crunch:
        return AppLocalizations.of(context).crunch;
      case ExerciseName.gobletSquatWithKettlebell:
        return AppLocalizations.of(context).gobletSquatWithKettlebell;
      case ExerciseName.hammerCurl:
        return AppLocalizations.of(context).hammerCurl;
      case ExerciseName.horizontalLegPress:
        return AppLocalizations.of(context).horizontalLegPress;
      case ExerciseName.inclineBenchPressWithDumbbell:
        return AppLocalizations.of(context).inclineBenchPressWithDumbbell;
      case ExerciseName.latPullDownWideGripWithCable:
        return AppLocalizations.of(context).latPullDownWideGripWithCable;
      case ExerciseName.lyingLegCurl:
        return AppLocalizations.of(context).lyingLegCurl;
      case ExerciseName.legExtension:
        return AppLocalizations.of(context).legExtension;
      case ExerciseName.legPress45Degrees:
        return AppLocalizations.of(context).legPress45Degrees;
      case ExerciseName.overheadPressWithDumbbell:
        return AppLocalizations.of(context).overheadPressWithDumbbell;
      case ExerciseName.plank:
        return AppLocalizations.of(context).plank;
      case ExerciseName.pushUp:
        return AppLocalizations.of(context).pushUp;
      case ExerciseName.seatedLegPress:
        return AppLocalizations.of(context).seatedLegPress;
      case ExerciseName.standingCalfRaise:
        return AppLocalizations.of(context).standingCalfRaise;
      case ExerciseName.splitSquatWithKettlebell:
        return AppLocalizations.of(context).splitSquatWithKettlebell;
      case ExerciseName.tricepsExtensionWithDumbbell:
        return AppLocalizations.of(context).tricepsExtensionWithDumbbell;
    }
  }
}
