import 'package:api_sample/controller/services.dart';
import 'package:api_sample/model/movie_model.dart';
import 'package:api_sample/widgets/movies_slider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  final TMDBService service = TMDBService();
  late Future<List<Movie>> _topRated;
  late Future<List<Movie>> _upcomingMovies;
  late Future<List<Movie>> _trendingMovies;

    @override
  void initState() {
    super.initState();
   _topRated = fetchSeriesData();
   _upcomingMovies=fetchUpcomingMovies();
    _trendingMovies=toprated();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Games'),
        actions: [
            IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
    
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
            MoviesSlider(
              movieDetails: _topRated,
              borderRadius: 2,
              containerHeight: 200,
              containerWidth: 250,
            ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Trending Games',
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
               MoviesSlider(
                movieDetails: _upcomingMovies,
                  borderRadius: 8,
              containerHeight: 150,
              containerWidth: 250,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Best of Year',
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
              const SizedBox(
                height: 32,
              ),
             MoviesSlider(
                movieDetails:_trendingMovies ,
                  borderRadius: 8,
              containerHeight: 150,
              containerWidth: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<List<Movie>> fetchSeriesData() async {
    try {
      final results = await service.fetchMovies();
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      return [];
    }
  }

   Future<List<Movie>> fetchUpcomingMovies() async {
    try {
      final results = await service.fetchUpcomingMovies();
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      return [];
    }
  }

     Future<List<Movie>> toprated() async {
    try {
      final results = await service.toprated();
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      return [];
    }
  }

}