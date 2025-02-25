 import 'dart:convert';
import 'package:api_sample/controller/api_key.dart';
import 'package:http/http.dart' as http;

class TMDBService {
  final String baseUrl = 'https://api.themoviedb.org/3';
// https://api.themoviedb.org/3/movie/popular?8dba56e1c17d44e1a2da75fe9ceeef7d
  Future<dynamic> _get(String path) async {
    final uri = Uri.parse('$baseUrl$path?api_key=$apiKey');

    final response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw Exception(
            'Bad Request: The server could not understand the request due to invalid syntax.');
      case 401:
        throw Exception(
            'Unauthorized: The client must authenticate itself to get the requested response.');
      case 403:
        throw Exception(
            'Forbidden: The client does not have access rights to the content.');
      case 404:
        throw Exception(
            'Not Found: The server can not find the requested resource.');
      case 500:
        throw Exception(
            'Internal Server Error: The server has encountered a situation it doesn’t know how to handle.');
      case 502:
        throw Exception(
            'Bad Gateway: The server, while acting as a gateway or proxy, received an invalid response from the upstream server.');
      case 503:
        throw Exception(
            'Service Unavailable: The server is not ready to handle the request.');
      case 504:
        throw Exception(
            'Gateway Timeout: The server, while acting as a gateway or proxy, did not get a response in time from the upstream server.');
      default:
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchMovies() async {
    final data = await _get('/movie/popular');
    return data['results'];
  }

  Future<List<dynamic>> fetchUpcomingMovies() async {
    final data = await _get('/movie/upcoming');
    return data['results'];
  }

  Future<List<dynamic>> fetchNowPlayingMovies() async {
    final data = await _get('/movie/now_playing');
    return data['results'];
  }

  Future<List<dynamic>> fetchListSet() async {
    final data = await _get('/movie/now_playing');
    return data['results'];
  }

  Future<List<dynamic>> toprated() async {
    final data = await _get('/movie/top_rated');
    return data['results'];
  }

  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    return await _get('/movie/$movieId');
  }
}