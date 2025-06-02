

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/app/app.locator.dart';
import '../../../services/firestoredata_service.dart';
import '../../../services/speech_to_text_service.dart';
import '../../../services/toastmessage_service.dart';

class SelectfileDialogDialogModel extends BaseViewModel {
  TextEditingController projectctrl = TextEditingController();
  final firestoreService = locator<FirestoredataService>();
  TextEditingController descriptionctrl = TextEditingController();
  final _navigationService = locator<NavigationService>();

  final toastService = locator<ToastmessageService>();
  final speechtotextservice = locator<SpeechToTextService>();
  final Function(dynamic data) onDataChanged;
  
  final fileBytes;
  final fileName;
  final sizeInMb;
  final extractedList;
  final projectname;
  SelectfileDialogDialogModel(this.fileBytes, this.fileName, this.sizeInMb,
      this.extractedList, this.onDataChanged, this.projectname);

  bool loading = false;
  setloadingvalue(bool value) {
    loading = value;
    notifyListeners();
  }

  // Future<void> saveDataToFirestore(Map<String, dynamic> uploadData) async {
  //   try {
  //     //setloadingvalue(true);
  //     String result = await firestoreService.saveData(uploadData);
  //     toastService.toastmessage(result);
  //     //setloadingvalue(false);
  //     // projectctrl.clear();
  //     // descriptionctrl.clear();
  //     // extractedList = [];
  //   } catch (e) {
  //     toastService.toastmessage(e.toString());
  //   }
  // }

  Future<void> uploadata(BuildContext context) async {
    setBusy(true);
    try {
      if (fileBytes == null) {
        toastService.toastmessage(
            "No file has been picked. Please select a file first.");
        return;
      }
      if (fileBytes != null && fileName != null && sizeInMb != null) {
        extractedList.add(
          await speechtotextservice.uploadAudioFile(
            fileBytes!,
            fileName!,
            sizeInMb!,
          ),
        );

        // Notify listeners to update the UI
        notifyListeners();


        // Save the data to Firebase
        // await saveDataToFirestore(uploadData);

        // Show a success message
        toastService.toastmessage("File uploaded successfully.");

        onDataChanged(extractedList);
        _navigationService.back();
      } else {
        toastService.toastmessage("Failed to upload");
      }
    } catch (e) {
      toastService.toastmessage("Error$e");
    }
    setBusy(false);
  }
}
