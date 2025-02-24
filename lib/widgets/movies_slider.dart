import 'package:api_sample/screens/movie_detail.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String>imagePaths=[
       'assets/apo.jpeg',
      'assets/MH.jpeg',
      'assets/basic.jpeg',
       'assets/apo.jpeg',
      'assets/MH.jpeg',
      'assets/basic.jpeg',
       'assets/apo.jpeg',
      'assets/MH.jpeg',
      'assets/basic.jpeg',
      'assets/apo.jpeg',
    ];
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail(),));
                },
                child: Container(
                  height: 200,
                  width: 150,
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                    
                  ),
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

