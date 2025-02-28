import 'package:api_sample/widgets/movies_slider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Games'),
        actions: [
            IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        // centerTitle: true,
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
            MoviesSlider(
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
              const MoviesSlider(
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
              const MoviesSlider(
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
}