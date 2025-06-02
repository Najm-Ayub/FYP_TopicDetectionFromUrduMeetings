import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/app/app.locator.dart';
import 'package:topicdetectionweb/services/speech_to_text_service.dart';
import 'package:topicdetectionweb/services/toastmessage_service.dart';

class InfoAlertDialogModel extends BaseViewModel {
  final speechtotextservice = locator<SpeechToTextService>();
  final toastService = locator<ToastmessageService>();

  double scale = 1.0;
  double previousScale = 1.0;

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void setzoomIN() {
    scale -= 0.1;
    if (scale < 1.0) {
      scale = 1.0;
    }
    notifyListeners();
  }

  void setzoomOut() {
    scale += 0.1;
    if (scale > 3.0) {
      scale = 3.0;
    }
    notifyListeners();
  }

  void setscale(double detailscale) {
    scale = previousScale * detailscale;
    if (scale < 1.0) {
      scale = 1.0;
    }
    if (scale > 3.0) {
      scale = 3.0;
    }
    notifyListeners();
  }
}
