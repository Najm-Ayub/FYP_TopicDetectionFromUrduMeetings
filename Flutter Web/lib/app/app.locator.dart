// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/authentication_service.dart';
import '../services/display_topic_service.dart';
import '../services/fetchdata_service.dart';
import '../services/firestoredata_service.dart';
import '../services/profileinformation_service.dart';
import '../services/segmentapi_service.dart';
import '../services/speech_to_text_service.dart';
import '../services/textto_file_service.dart';
import '../services/toastmessage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ToastmessageService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => SpeechToTextService());
  locator.registerLazySingleton(() => FirestoredataService());
  locator.registerLazySingleton(() => FetchdataService());
  locator.registerLazySingleton(() => ProfileinformationService());
  locator.registerLazySingleton(() => SegmentapiService());
  locator.registerLazySingleton(() => DisplayTopicService());
  locator.registerLazySingleton(() => TexttoFileService());
}
