import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seemovies/features/home/models/movie_model.dart';

class SeriesFetchService {
  static const String baseUrl = 'https://api.tvmaze.com';

  Future<List<SerieModel>> fecthSeries() async {
    final response = await http.get(
      Uri.parse("$baseUrl/shows"),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => SerieModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<SerieModel?> fetchOnlySerie(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/shows/$id"),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return SerieModel.fromJson(data);
    } else {
      return null;
    }
  }
}
