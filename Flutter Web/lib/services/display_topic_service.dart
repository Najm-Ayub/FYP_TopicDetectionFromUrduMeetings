// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DisplayTopicService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<Map<String, dynamic>> getSummaries(List<String> segments) async {
//     String apiUrl = 'http://127.0.0.1:5001/summarize';
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'segments': segments}),
//       );

//       if (response.statusCode == 200) {
//         // Parse the response JSON
//         final Map<String, dynamic> data = jsonDecode(response.body);

//         // Access the summaries
//         List<dynamic> summaries = data['summaries'];

//         // Store the summaries in Firestore
//         await _storeSummariesInFirestore(summaries);

//         return {'summaries': summaries};
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         return {'error': 'Request failed with status: ${response.statusCode}'};

//       }
//     } catch (e) {
//       print('Error: $e');
//       return {'error': 'Error: $e'};
//     }
//   }

//   Future<void> _storeSummariesInFirestore(List<dynamic> summaries) async {
//     try {
//       CollectionReference summariesCollection =
//           _firestore.collection('summaries');

//       // Add each summary to Firestore
//       for (dynamic summary in summaries) {
//         await summariesCollection.add({'summary': summary});
//       }
//     } catch (e) {
//       print('Error storing summaries in Firestore: $e');
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayTopicService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get summaries from API

  Future<List<String>> getSummaries(List<String> segments) async {
  String apiUrl = 'http://127.0.0.1:5001/summarize';

  // Generate a default meeting ID based on the current timestamp
  String meetingId = DateTime.now().millisecondsSinceEpoch.toString();

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'segments': segments}),
    );

    if (response.statusCode == 200) {
      // Parse the response JSON
      final dynamic responseData = jsonDecode(response.body);

      // Handle the case where the response is a list
      List<dynamic> summaries;
      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('summaries')) {
        summaries = responseData['summaries'] ?? [];
      } else {
        // Handle other unexpected cases
        print('Unexpected response format: $responseData');
        return ['error: Unexpected response format'];
      }

      // Convert nested arrays to JSON strings
      List<String> stringSummaries = summaries.map((summaryList) {
        return jsonEncode(summaryList);
      }).toList();

      // Store all summaries in a single document within the 'meetings' collection
      await _storeSummariesInFirestore(meetingId, stringSummaries);

      return stringSummaries;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return ['error: Request failed with status: ${response.statusCode}'];
    }
  } catch (e) {
    print('Error: $e');
    return ['error: Error: $e'];
  }
}


// Store summaries in firestore

  Future<void> _storeSummariesInFirestore(
      String meetingId, List<String> summaries) async {
    try {
      CollectionReference meetingsCollection =
          _firestore.collection('meetings');

      // Store the summaries list in Firestore with the meeting ID as the document ID
      await meetingsCollection
          .doc(meetingId)
          .set({'summaries': summaries, 'id': meetingId});

      print('Summaries stored successfully in Firestore.');
    } catch (e) {
      print('Error storing summaries in Firestore: $e');
    }
  }


// Future<List<List<String>>> getAllMeetings() async {
//   try {
//     QuerySnapshot meetingsSnapshot = await _firestore.collection('meetings').get();

//     List<List<String>> allMeetings = [];
//     for (QueryDocumentSnapshot meetingDocument in meetingsSnapshot.docs) {
//       Map<String, dynamic>? data = meetingDocument.data() as Map<String, dynamic>?;

//       if (data != null && data.containsKey('summaries')) {
//         List<String> summaries = List<String>.from(data['summaries']);
//         allMeetings.add(summaries);
//       }
//     }

//     return allMeetings;
//   } catch (e) {
//     print('Error fetching all meetings from Firestore: $e');
//     return [];
//   }
// }



}
