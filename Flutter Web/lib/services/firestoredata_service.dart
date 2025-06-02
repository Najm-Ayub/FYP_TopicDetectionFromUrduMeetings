import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoredataService {
  Future<String> saveData(int index,  Map<String, dynamic> uploadData,
      {String? eidtProjectId}) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String key =
          eidtProjectId ?? DateTime.now().millisecondsSinceEpoch.toString();

      if (uploadData['mettinges'] != null &&
          uploadData['mettinges'].length >= 0) {
        DocumentReference documentReference =
            firestore.collection('your_collection_name').doc(key);

        await documentReference.update({
          'title': uploadData['title'],
          'mettinges': uploadData['mettinges'],
          'Description': uploadData['Description'],
          'Summries.Meating$index': uploadData['Summries'],
          'timestamp': FieldValue.serverTimestamp(),
          'id': key
        });

        return "Data saved to Firestore successfully";
      } else {
        return "You don't have any file for upload";
      }
    } catch (e) {
      return "Error saving data to Firestore: $e";
    }
  }
}
