import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadImage(File imageFile) async {
  final uri = Uri.parse('https://your-api-endpoint.com/upload'); // Replace with your API endpoint
  final request = http.MultipartRequest('POST', uri);
  request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

  try {
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error uploading image: $error');
  }
}