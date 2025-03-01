import 'package:api_sample/controller/services.dart';
import 'package:api_sample/model/movie_model.dart';
import 'package:api_sample/view/movie_detail.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatefulWidget {
  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final Future <List<Movie>>movieDetails;
  const MoviesSlider(
      {super.key,
      required this.containerWidth,
      required this.containerHeight,
      required this.borderRadius,
       required this.movieDetails,
      
      });

  @override
  State<MoviesSlider> createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.containerHeight,
      width: double.infinity,
      child: FutureBuilder<List<Movie>>(
        future: widget.movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(child: Text("Error loading movies"));
          }

          List<Movie> movies = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Movie movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MovieDetail(movieDetails: movie,)),
                      );
                    },
                    child: SizedBox(
                      height: widget.containerHeight,
                      width: widget.containerWidth,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
