

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewHotContent extends StatefulWidget {
  final String title;
  final String releaseDate;
  final String description;
  final String image;
    final String month;
    final String date;
    final String overview;
  
  const NewHotContent({
    Key? key, 
    required this.title,
    required this.releaseDate,
    required this.description,
    required this.image,
     required this.month,
      required this.date,
      required this.overview,
  }) : super(key: key);

  @override
  State<NewHotContent> createState() => _NewHotContentState();
}

class _NewHotContentState extends State<NewHotContent> {
  //   final TMDBService service = TMDBService();
  // late Future<List<Movie>> _series;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: 50,
            child: Column(
  crossAxisAlignment: CrossAxisAlignment.center, 
  mainAxisSize: MainAxisSize.min, 
  children: [
    Text(
    'Jan',
      style: GoogleFonts.openSans(
        fontSize: 12, 
        fontWeight: FontWeight.w900,
      ),
    ),
    Text(
      // widget.date[],
      '12',
      style: GoogleFonts.openSans(
        fontSize: 28, 
        fontWeight: FontWeight.w900,
      ),
    ),
  ],
)
          ),
            SizedBox(width: 12),
            Container(
              height: 300,
              width: 290,
             child:  Image.network(
'https://image.tmdb.org/t/p/w500${widget.image}',
          fit: BoxFit.cover,
          height: 35,
          filterQuality: FilterQuality.high,
        ),
            ),
          ],
        ),
        SizedBox(height: 15),
        
        Container(
          padding: EdgeInsets.only(left: 77),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 80,
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.notifications_none),
                        SizedBox(width: 12),
                        Icon(Icons.info_outline),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 20),
              Text(widget.releaseDate),
              SizedBox(height: 20),
              Text(
                widget.overview,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(height: 30), 
      ],
    );
  }
}
