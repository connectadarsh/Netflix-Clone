import 'package:api_sample/controller/services.dart';
import 'package:api_sample/model/movie_model.dart';
import 'package:api_sample/widgets/new_hot_content.dart';
import 'package:flutter/material.dart';

class NewHot extends StatefulWidget {
  const NewHot({super.key});

  @override
  State<NewHot> createState() => _NewHotState();
}

class _NewHotState extends State<NewHot> {
  final TMDBService service = TMDBService();
  late Future<List<Movie>> _new;

  @override
  void initState() {
    super.initState();
    _new = toprated();
  }

  Future<List<Movie>> toprated() async {
    try {
      final results = await service.toprated();
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('New & Hot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: _new,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Error loading movies"));
          }

          List<Movie> movies = snapshot.data!;

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Movie movie = movies[index];
              return NewHotContent(
                title: movie.title, 
                releaseDate: movie.releasedate, 
                description: movie.title,
                image: movie.posterPath, 
                month: movie.releasedate, 
                date: movie.releasedate, 
                overview:movie.overview,
              );
            },
          );
        },
      ),
    );
  }
}



