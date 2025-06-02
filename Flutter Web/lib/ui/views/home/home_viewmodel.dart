
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/app/app.locator.dart';
import 'package:topicdetectionweb/app/app.router.dart';
import 'package:topicdetectionweb/services/authentication_service.dart';
import 'package:topicdetectionweb/services/toastmessage_service.dart';
import '../../../app/app.dialogs.dart';
import '../../../services/display_topic_service.dart';
import '../../../services/fetchdata_service.dart';
import '../../../services/firestoredata_service.dart';
import '../../../services/segmentapi_service.dart';
import '../../../services/textto_file_service.dart';

final dialogService = locator<DialogService>();

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  final _authservice = locator<AuthenticationService>();
  TextEditingController projectctrl = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreService = locator<FirestoredataService>();
  final segment = locator<SegmentapiService>();
  final displayTopic = locator<DisplayTopicService>();
  final textTofile = locator<TexttoFileService>();

  List<String> displayedSegments = [];
 var summaryList;

  TextEditingController descriptionctrl = TextEditingController();
  Uint8List? fileBytes;
  String? fileName;
  double? sizeInMb;
  String? eidtProjectId;
  final controller = SidebarXController(selectedIndex: 0, extended: true);

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  bool loading = false;
  String name = 'Edit Project';

  setloadingvalue(bool value) {
    loading = value;
    notifyListeners();
  }

  setPage(val, Map data) {
    controller.selectIndex(val);
    if (data.containsKey("title")) {
      projectctrl.text = data["title"];
    }
    if (data.containsKey("Description")) {
      descriptionctrl.text = data['Description'];
    }
    extractedList = data["mettinges"];
    summaryList = data["Summries"];
    eidtProjectId = data["id"];
    notifyListeners();
  }

  navigationLandingPage() {
    _navigationService.replaceWithLandingPageView();
  }

  logout() async {
    await _authservice.logout();
    _navigationService.replaceWithLandingPageView();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final toastService = locator<ToastmessageService>();
  final fetchdataservice = locator<FetchdataService>();
  List<dynamic> extractedList = [];

  List<dynamic> summariesList = [];

  Future<FilePickerResult?> pickAFile() async {
    FilePickerResult? pickedFileResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        '.acc',
        'flac',
        'mp4',
        'wav',
        'aiff',
        'mp3',
        'm4a',
        'flv',
        'mkv',
        'mov',
        'webm',
        'm4v',
        'mpeg',
        'mpg',
        'HEVC',
      ],
    );
    if (pickedFileResult != null && pickedFileResult.files.isNotEmpty) {
      final platformFile = pickedFileResult.files.first;
      fileBytes = platformFile.bytes;
      fileName = platformFile.name;
      final sizeInBytes = fileBytes!.lengthInBytes;
      sizeInMb = sizeInBytes / (1024 * 1024);
    }

    notifyListeners();
    return pickedFileResult;
  }

  void updateSummaries(summries) {
    summariesList = summries;
    notifyListeners();
  }

  onProceed(int index) async {
    Map<String, dynamic> uploadData = {
      "title": projectctrl.text,
      "mettinges": extractedList,
      "Description": descriptionctrl.text,
      "Summries": summariesList,
    };

    try {
      String result = await firestoreService.saveData(index, uploadData,
          eidtProjectId: eidtProjectId);

      toastService.toastmessage(result);
      // projectctrl.clear();
      // descriptionctrl.clear();
      // extractedList = [];
    } catch (e) {
      toastService.toastmessage(e.toString());
    }
  }

  void deleteFile(int index) {
    if (index >= 0 && index < extractedList.length) {
      extractedList.removeAt(index);
    }
    notifyListeners();
  }

  setcreate(val) {
     projectctrl.clear();
    descriptionctrl.clear();
      extractedList.clear();
    controller.selectIndex(val);
    notifyListeners();
  }

  void showDialog(String filename, double size) {
    dialogService.showCustomDialog(
      variant: DialogType.selectfileDialog,
      title: filename,
      description: size.toStringAsFixed(2),
      data: {
        'fileBytes': fileBytes,
        'fileName': fileName,
        'sizeInMb': sizeInMb,
        'homemodel': HomeViewModel(),
        'extractedlist': extractedList,
        'Projectname': projectctrl.text,
        'onDataChanged': (data) {
          updateData(data);
        },
      },
    );
  }

  Future<void> filePick(BuildContext context) async {
    FilePickerResult? pickedFileResult = await pickAFile();

    try {
      if (pickedFileResult != null && pickedFileResult.files.isNotEmpty) {
        setBusy(true);
        showDialog(
          fileName!,
          sizeInMb!,
        );
        notifyListeners();
      } else {
        toastService.toastmessage("No .wav file selected.");
      }
    } catch (e) {
      toastService.toastmessage(" $e");
    }
    setBusy(false);
  }

  void updateData(dynamic data) {
    extractedList = data;
    notifyListeners();
  }

  void displayDialog(String urdutext, String filename) {
    dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: filename,
      description: urdutext,
    );
  }

  void updatename(String updatename) {
    name = updatename;
    notifyListeners();
  }

  String? userName;

  Future<void> fetchUserDisplayName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName = user.displayName;
      notifyListeners(); // Notify the UI to update
    }
  }

  void updateSegment(segment) {
    displayedSegments = segment;
    notifyListeners();
  }

  void displaySegment() {
    dialogService.showCustomDialog(
      variant: DialogType.displaySegments,
      data: {
        'segment': displayedSegments,
      },
    );
  }

 void displaysummary(List<dynamic> summaryDataList,String urduText) async {
  try {
    // Show custom dialog with the list data
    dialogService.showCustomDialog(
      variant: DialogType.displayTopic,
   data:{
       'urduText': urduText,
       'summaries': summaryDataList,      
    }

    );
  } catch (e) {
    
    print('Error displaying summary: $e');
  }
}


 


}
