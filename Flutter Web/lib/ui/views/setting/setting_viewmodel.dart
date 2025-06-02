import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/app/app.locator.dart';

import '../../../services/profileinformation_service.dart';
import '../../../services/toastmessage_service.dart';

class SettingViewModel extends BaseViewModel {
  TextEditingController namectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();
  TextEditingController conpassctrl = TextEditingController();
  TextEditingController phonectrl = TextEditingController();
  String id = '';
  final ProfileinformationService profileservice =
      locator<ProfileinformationService>();
  final ToastmessageService toastService = locator<ToastmessageService>();

  // final profileUpdateStream =
  //     FirebaseFirestore.instance.collection("UserProfile").snapshots();

  saveUserinformation(String uid) async {
    try {
      setBusy(true);
      profileservice
          .saveDataFirestore(
        namectrl.text.toString(),
        passctrl.text.toString(),
        conpassctrl.text.toString(),
        phonectrl.text.toString(),
        emailctrl.text.toString(),
        uid,
      )
          .then((value) {
        toastService.toastmessage("Data uploaded sucessfully.....");
      });
    } catch (e) {
      toastService.toastmessage("Error in storing information $e");
    }
    setBusy(false);
  }
}
