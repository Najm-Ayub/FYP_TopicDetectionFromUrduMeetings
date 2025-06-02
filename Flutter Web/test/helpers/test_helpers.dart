import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:topicdetectionweb/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/services/toastmessage_service.dart';
import 'package:topicdetectionweb/services/authentication_service.dart';
import 'package:topicdetectionweb/services/speech_to_text_service.dart';
import 'package:topicdetectionweb/services/firestoredata_service.dart';
import 'package:topicdetectionweb/services/fetchdata_service.dart';
import 'package:topicdetectionweb/services/profileinformation_service.dart';
import 'package:topicdetectionweb/services/segmentapi_service.dart';
import 'package:topicdetectionweb/services/display_topic_service.dart';
import 'package:topicdetectionweb/services/textto_file_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ToastmessageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SpeechToTextService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FirestoredataService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchdataService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ProfileinformationService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SegmentapiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DisplayTopicService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TexttoFileService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterToastmessageService();
  getAndRegisterAuthenticationService();
  getAndRegisterSpeechToTextService();
  getAndRegisterFirestoredataService();
  getAndRegisterFetchdataService();
  getAndRegisterProfileinformationService();
  getAndRegisterSegmentapiService();
  getAndRegisterDisplayTopicService();
  getAndRegisterTexttoFileService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockToastmessageService getAndRegisterToastmessageService() {
  _removeRegistrationIfExists<ToastmessageService>();
  final service = MockToastmessageService();
  locator.registerSingleton<ToastmessageService>(service);
  return service;
}

MockAuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final service = MockAuthenticationService();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

MockSpeechToTextService getAndRegisterSpeechToTextService() {
  _removeRegistrationIfExists<SpeechToTextService>();
  final service = MockSpeechToTextService();
  locator.registerSingleton<SpeechToTextService>(service);
  return service;
}

MockFirestoredataService getAndRegisterFirestoredataService() {
  _removeRegistrationIfExists<FirestoredataService>();
  final service = MockFirestoredataService();
  locator.registerSingleton<FirestoredataService>(service);
  return service;
}

MockFetchdataService getAndRegisterFetchdataService() {
  _removeRegistrationIfExists<FetchdataService>();
  final service = MockFetchdataService();
  locator.registerSingleton<FetchdataService>(service);
  return service;
}

MockProfileinformationService getAndRegisterProfileinformationService() {
  _removeRegistrationIfExists<ProfileinformationService>();
  final service = MockProfileinformationService();
  locator.registerSingleton<ProfileinformationService>(service);
  return service;
}

MockSegmentapiService getAndRegisterSegmentapiService() {
  _removeRegistrationIfExists<SegmentapiService>();
  final service = MockSegmentapiService();
  locator.registerSingleton<SegmentapiService>(service);
  return service;
}

MockDisplayTopicService getAndRegisterDisplayTopicService() {
  _removeRegistrationIfExists<DisplayTopicService>();
  final service = MockDisplayTopicService();
  locator.registerSingleton<DisplayTopicService>(service);
  return service;
}

MockTexttoFileService getAndRegisterTexttoFileService() {
  _removeRegistrationIfExists<TexttoFileService>();
  final service = MockTexttoFileService();
  locator.registerSingleton<TexttoFileService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
