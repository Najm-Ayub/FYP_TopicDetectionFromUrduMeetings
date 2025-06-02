import 'package:topicdetectionweb/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:topicdetectionweb/ui/dialogs/info_alert/info_alert_dialog.dart';

import 'package:topicdetectionweb/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/ui/views/signup/signup_view.dart';
import 'package:topicdetectionweb/ui/views/signin/signin_view.dart';
import 'package:topicdetectionweb/ui/views/home/home_view.dart';
import 'package:topicdetectionweb/ui/views/historypage/Project_view.dart';
import 'package:topicdetectionweb/ui/views/aboutus/aboutus_view.dart';
import 'package:topicdetectionweb/ui/views/contactus/contactus_view.dart';
import 'package:topicdetectionweb/services/toastmessage_service.dart';
import 'package:topicdetectionweb/services/authentication_service.dart';
import 'package:topicdetectionweb/ui/views/landing_page/landing_page_view.dart';
import 'package:topicdetectionweb/services/speech_to_text_service.dart';
import 'package:topicdetectionweb/services/firestoredata_service.dart';
import 'package:topicdetectionweb/ui/views/dashborad/dashborad_view.dart';
import 'package:topicdetectionweb/ui/dialogs/selectfile_dialog/selectfile_dialog_dialog.dart';
import 'package:topicdetectionweb/services/fetchdata_service.dart';
import 'package:topicdetectionweb/ui/dialogs/delete_project/delete_project_dialog.dart';
import 'package:topicdetectionweb/ui/views/setting/setting_view.dart';
import 'package:topicdetectionweb/services/profileinformation_service.dart';
import 'package:topicdetectionweb/ui/views/privacy_policy/privacy_policy_view.dart';
import 'package:topicdetectionweb/ui/views/f_a_qs/f_a_qs_view.dart';
import 'package:topicdetectionweb/services/segmentapi_service.dart';
import 'package:topicdetectionweb/ui/dialogs/display_segments/display_segments_dialog.dart';
import 'package:topicdetectionweb/services/display_topic_service.dart';
import 'package:topicdetectionweb/ui/dialogs/display_topic/display_topic_dialog.dart';
import 'package:topicdetectionweb/services/textto_file_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: SigninView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: HistorypageView),
    MaterialRoute(page: AboutusView),
    MaterialRoute(page: ContactusView),
    MaterialRoute(page: LandingPageView),
    MaterialRoute(page: DashboradView),
    MaterialRoute(page: SettingView),
    MaterialRoute(page: PrivacyPolicyView),
    MaterialRoute(page: FAQsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ToastmessageService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: SpeechToTextService),
    LazySingleton(classType: FirestoredataService),
    LazySingleton(classType: FetchdataService),
    LazySingleton(classType: ProfileinformationService),
    LazySingleton(classType: SegmentapiService),
    LazySingleton(classType: DisplayTopicService),
    LazySingleton(classType: TexttoFileService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: SelectfileDialogDialog),
    StackedDialog(classType: DeleteProjectDialog),
    StackedDialog(classType: DisplaySegmentsDialog),
    StackedDialog(classType: DisplayTopicDialog),
// @stacked-dialog
  ],
)
class App {}
