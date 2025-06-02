import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileinformationService {
  Future<void> saveDataFirestore(String name, String pass, String confirmPass,
      String phone, String email, String uid) async {
    await FirebaseFirestore.instance.collection("UserProfile").doc(uid).set({
      'Email': email,
      'Name': name,
      'password': pass,
      'ConfirmPassword': confirmPass,
      'Phone': phone,
      'id': uid
    });
  }
}
