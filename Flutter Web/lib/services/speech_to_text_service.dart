// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';
//import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// // ... (Previous code)

// class SpeechToTextService {
//   Future<Map> uploadAudioFile(
//       List<int> fileBytes, String fileName, double size) async {
//     String apiUrl = "http://202.142.147.3:5008/ClE_ASR";
//     Map uploadResult = {};

//     var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

//     request.files.add(
//       http.MultipartFile.fromBytes(
//         'file',
//         fileBytes,
//         filename: fileName,
//         contentType: MediaType('audio', 'wav'),
//       ),
//     );

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       var responseBody = await response.stream.bytesToString();
//       var lines = responseBody.split('\n');

//       var urduText = '';
//       for (var line in lines) {
//         if (line.contains('spk')) {
//           var parts = line.split(' ');
//           if (parts.length >= 5) {
//             urduText += '${parts.sublist(5).join(' ')}\n\n';  // Add two newlines after each line
//           }
//         }
//       }

//       // Save the Urdu text to a file
//       var outputFilePath = 'urdu_text.txt';
//       await File(outputFilePath).writeAsString(urduText);

//       uploadResult = {
//         "fileName": fileName,
//         "size": size,
//         "urduText": urduText,
//         "outputFilePath": outputFilePath,
//       };

//     } else {
//       print("API call failed with status code: ${response.statusCode}");
//     }
//     return uploadResult;
//   }
// }

class SpeechToTextService {
  Future<Map> uploadAudioFile(
      List<int> fileBytes, String fileName, double size) async {
    String apiUrl = "http://202.142.147.3:5008/ClE_ASR";
    Map uploadResult = {};

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: fileName,
        contentType: MediaType('audio', 'wav'),
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var lines = responseBody.split('\n');

      var urduText = '';
      for (var line in lines) {
        if (line.contains('spk')) {
          var parts = line.split(' ');
          if (parts.length >= 5) {
            urduText += parts.sublist(5).join(' ');
          }
        }
      }
      uploadResult = {
        "fileName": fileName,
        "size": size,
        "urduText": urduText,
      };
      final urduTextLines = urduText.split('۔').join('\n\n');
      final blob = html.Blob([Uint8List.fromList(utf8.encode(urduTextLines))],
          'text/plain;charset=utf-8');

      final url = html.Url.createObjectUrlFromBlob(blob);
      // ignore: avoid_print
      print(File(url));

      //html.window.open(url, 'web');

      // ignore: unused_local_variable

      //   final anchor = html.AnchorElement(href: url)
      //     ..target = 'web'
      //     ..download = 'urdu_text'
      //     ..click();

      //  html.Url.revokeObjectUrl(url);
    } else {
      // ignore: avoid_print
      print("API call failed with status code: ${response.statusCode}");
    }
    return uploadResult;
  }
}
