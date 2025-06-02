import 'package:cloud_firestore/cloud_firestore.dart';

class FetchdataService {
  Future<List<Map<String, dynamic>>> fetchDatafromfirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        firestore.collection('your_collection_name');
    QuerySnapshot querySnapshot = await collectionReference.get();
    return querySnapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return data;
    }).toList();
  }
}
