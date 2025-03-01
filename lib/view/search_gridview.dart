import 'dart:async';
import 'package:api_sample/controller/services.dart';
import 'package:api_sample/model/movie_model.dart';
import 'package:flutter/material.dart';

class SearchPageGridView extends StatefulWidget {
  const SearchPageGridView({super.key});

  @override
  State<SearchPageGridView> createState() => _SearchPageGridViewState();
}

class _SearchPageGridViewState extends State<SearchPageGridView> {
  final TMDBService service = TMDBService();
  late Future<List<Movie>> _new;
  String _searchQuery = "";
  Timer? _debounce;

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

  List<Movie> _filterMovies(List<Movie> movies) {
    return movies.where((movie) {
      final title = movie.title.toLowerCase();
      final searchQuery = _searchQuery.toLowerCase();
      return title.contains(searchQuery);
    }).toList();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Search Movies'),
  
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies',
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: _new,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Error loading movies"));
                }

                final listmovies = _filterMovies(snapshot.data!);

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: listmovies.length,
                  itemBuilder: (context, index) {
                    Movie movie = listmovies[index];
                    return Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}