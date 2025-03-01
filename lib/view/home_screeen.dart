import 'package:api_sample/controller/services.dart';
import 'package:api_sample/model/movie_model.dart';
import 'package:api_sample/view/search_gridview.dart';
import 'package:api_sample/widgets/movies_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/Netflix N.png',
          fit: BoxFit.cover,
          height: 35,
          filterQuality: FilterQuality.high,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {},
          ),
          SizedBox(width: 8,),
            IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => SearchPageGridView(),));
            },
          ),
        ],
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
              SizedBox(height: 32),
               TrendingSlider(
                movieDetails: _trendingMovies,
                containerHeight: 300,
                containerWidth: 200,
                borderRadius: 12,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Top rated movies',
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
               MoviesSlider(
                movieDetails: _topRated,
                borderRadius: 8,
                containerHeight: 200,
                containerWidth: 150,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Upcoming movies',
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
              const SizedBox(
                height: 32,
              ),
               MoviesSlider(
                movieDetails: _upcomingMovies,
                  borderRadius: 8,
                containerHeight: 200,
                containerWidth: 150,
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
