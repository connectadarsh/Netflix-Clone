import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String>imagePaths=[
      'assets/apo.jpeg',
      'assets/MH.jpeg',
      'assets/basic.jpeg',
    ];
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: imagePaths.length,
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.55,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enlargeCenterPage: true,
              pageSnapping: true),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 300,
                width: 200,
                // color: Colors.amber,
                child: Image.asset(
                  imagePaths[itemIndex],
                fit: BoxFit.cover                                 ,
                  ),
              ),
            );
          }),
    );
  }
}
