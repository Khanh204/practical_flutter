import 'dart:convert';
import 'package:http/http.dart' as http;
import 'place.dart';

class ApiService {
  static const String apiUrl = 'http://localhost:3000/places';

  Future<List<Place>> getAllPlaces() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((place) => Place.fromJson(place)).toList();
    } else {
      // Log the status code and response body
      print('Failed to load places, status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load places');
    }
  }
}
