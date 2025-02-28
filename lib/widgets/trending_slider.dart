import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  final double containerWidth;
   final double containerHeight;
      final double borderRadius;
  const  TrendingSlider({
    super.key,
    required this.containerWidth,
     required this.containerHeight,
     required this.borderRadius
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
              height: containerHeight,
              autoPlay: true,
              viewportFraction: 0.55,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enlargeCenterPage: true,
              pageSnapping: true),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                height: containerHeight,
                width: containerWidth,
                // color: Colors.amber,
                child: Image.asset(
                  imagePaths[itemIndex],
                fit: BoxFit.cover                                 
                  ),
              ),
            );
          }),
    );
  }
}
