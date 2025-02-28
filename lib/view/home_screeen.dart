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
            onPressed: () {},
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
              const TrendingSlider(
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
              const MoviesSlider(
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
              const MoviesSlider(
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
}
