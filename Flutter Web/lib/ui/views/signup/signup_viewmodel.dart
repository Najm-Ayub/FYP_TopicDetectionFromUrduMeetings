import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/app/app.locator.dart';
import 'package:topicdetectionweb/app/app.router.dart';
import 'package:topicdetectionweb/services/profileinformation_service.dart';

import '../../../services/toastmessage_service.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController namectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();
  TextEditingController conpassctrl = TextEditingController();
  TextEditingController phonectrl = TextEditingController();

  bool obsecure = true;
  bool obsecure1 = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _navigationService = locator<NavigationService>();
  final toastService = locator<ToastmessageService>();

  final ProfileinformationService profileservice =
      locator<ProfileinformationService>();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  void togglePasswordVisibility() {
    obsecure = !obsecure;
    notifyListeners();
  }

  void togglePasswordVisibility1() {
    obsecure1 = !obsecure1;
    notifyListeners();
  }

  void navigateTOSignin() {
    _navigationService.navigateToSigninView();
  }

  saveUserinformation(String uid) async {
    try {
      profileservice.saveDataFirestore(
        namectrl.text.toString(),
        passctrl.text.toString(),
        conpassctrl.text.toString(),
        phonectrl.text.toString(),
        emailctrl.text.toString(),
        uid,
      );
    } catch (e) {
      toastService.toastmessage("Error in storing information $e");
    }
  }
}
