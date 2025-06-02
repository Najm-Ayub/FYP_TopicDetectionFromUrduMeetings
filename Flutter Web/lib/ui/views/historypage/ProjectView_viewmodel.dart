import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../services/fetchdata_service.dart';
import '../../../services/toastmessage_service.dart';

class HistorypageViewModel extends BaseViewModel {
  int selectedProjectIndex = 0;
  int selectedFileIndex = 0;
  final toastService = locator<ToastmessageService>();
  final fetchdataservice = locator<FetchdataService>();
  final dialogService = locator<DialogService>();

  List<Map<String, dynamic>> firestoreData = [];

  Future<void> fetchDatafromfirestore() async {
    try {
      setBusy(true);
      firestoreData = await fetchdataservice.fetchDatafromfirestore();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      toastService.toastmessage("Error fetching data from Firestore: $e");
    }
  }

  Future<void> fetchData() async {
    await fetchDatafromfirestore();
    notifyListeners();
  }

  void setindex(int index) {
    selectedProjectIndex = index;
    notifyListeners();
  }

  void setFileIndex(int index) {
    selectedFileIndex = index;
    notifyListeners();
  }

  void showDialog(String urdutext, String filename) {
    dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: filename,
      description: urdutext,
    );
  }

  Future<void> deleteProjectDialog(String id) async {
    final dialogResponse = await dialogService.showCustomDialog(
        variant: DialogType.deleteProject, title: id);

    if (dialogResponse != null) {
      firestoreData.removeWhere((project) => project['id'] == id);
      notifyListeners();
    }
  }

// Display time format

 String formatDateTime(DateTime timestamp) {
    String day = '${timestamp.day}';
    if (day.length == 1) {
      day = '0$day';
    }
    String month = '${timestamp.month}';
    if (month.length == 1) {
      month = '0$month';
    }
    String year = '${timestamp.year}';
  

    return '$day/$month/$year';
  }


  
}
