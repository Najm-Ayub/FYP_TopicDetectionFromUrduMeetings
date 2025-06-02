
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TexttoFileService {


static const String apiUrl = 'http://127.0.0.1:5002/writefile';

  Future<void> writeFile(String textContent, String fileName) async {
    try {
      // Make a POST request to the Flask API
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: textContent,
        headers: {
          'Content-Type': 'text/plain',
        },
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Get the document directory using path_provider
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';

        // Save the received file content to a file
        await File(filePath).writeAsString(response.body);

        print('File content received successfully!');
      } else {
        throw Exception('Error: ${response.statusCode}\n${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }



  // static const String apiUrl = 'http://127.0.0.1:5002/writefile';

  // Future<void> writeFile(String textContent, String filePath) async {
  //   try {
  //     // Make a POST request to the Flask API
  //     http.Response response = await http.post(
  //       Uri.parse(apiUrl),
  //       body: textContent,
  //       headers: {
  //         HttpHeaders.contentTypeHeader: 'text/plain',
  //       },
  //     );

  //     // Check the response status
  //     if (response.statusCode == 200) {
  //       // Save the received file content to a file
  //       await File(filePath).writeAsString(response.body);

  //       print('File content received successfully!');
  //     } else {
  //       throw Exception('Error: ${response.statusCode}\n${response.body}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }

}
