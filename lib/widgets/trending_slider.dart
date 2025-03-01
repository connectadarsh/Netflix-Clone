import 'package:api_sample/model/movie_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatefulWidget {
  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final Future<List<Movie>> movieDetails;

  const TrendingSlider({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.borderRadius,
    required this.movieDetails,
  });

  @override
  State<TrendingSlider> createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder<List<Movie>>(
        future: widget.movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Error loading movies"));
          }

          List<Movie> movies = snapshot.data!;

          return CarouselSlider.builder(
            itemCount: movies.length,
            options: CarouselOptions(
              height: widget.containerHeight,
              autoPlay: true,
              viewportFraction: 0.55,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enlargeCenterPage: true,
              pageSnapping: true,
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              Movie movie = movies[itemIndex];
              return ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: Container(
                  height: widget.containerHeight,
                  width: widget.containerWidth,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
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
