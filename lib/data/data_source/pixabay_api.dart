import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_mvvm/data/dto/pixabay_dto.dart';

class PixabayApi {
  getImagesResult(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));
    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}
