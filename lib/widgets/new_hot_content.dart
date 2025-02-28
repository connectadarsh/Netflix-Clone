// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NewHotContent extends StatelessWidget {
  
//   const NewHotContent({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Release \n Date '),
//               SizedBox(width: 12),
//               Container(
//                 height: 200,
//                 width: 290,
//                 color: Colors.amber,
//               ),
//             ],
//           ),
//           SizedBox(height: 15),
          
        
//           Container(
//             padding: EdgeInsets.only(left: 77), // Fixed left padding aligned with container
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//          Row(
//       crossAxisAlignment: CrossAxisAlignment.start, // This aligns children to the top
//       children: [
//         Container(
//     width: 180,
//     child: Text(
//       'Basic Instinct',
//       style: GoogleFonts.openSans(
//         fontSize: 25,
//         fontWeight: FontWeight.w900,
//       ),
//       overflow: TextOverflow.ellipsis,
//       maxLines: 3,
//     ),
//         ),
//         Expanded(child: SizedBox()), // This pushes icons to the end
//         Container(
//     width: 80, // Fixed width container for icons
//     padding: EdgeInsets.only(top: 4), // Optional: Add some top padding to fine-tune position
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Icon(Icons.notifications_none),
//         SizedBox(width: 12),
//         Icon(Icons.info_outline),
//       ],
//     ),
//         ),
//         SizedBox(width: 10),
//       ],
//     ),
//                 SizedBox(height: 20),
//                 Text('Coming on sept 12'),
//                 SizedBox(height: 20),
//                 Text(
//                   "Detective Nick is tasked with investigating the murder of Johnny Boz. He suspects Johnny's girlfriend Catherine to be responsible for the act. However, things take a turn when he falls for her.",
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// in new_hot_content.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewHotContent extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String description;
  final String image;
    final String month;
    final String date;
  
  const NewHotContent({
    Key? key, 
    required this.title,
    required this.releaseDate,
    required this.description,
    required this.image,
     required this.month,
      required this.date,
  }) : super(key: key);

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
      month,
      style: GoogleFonts.openSans(
        fontSize: 12, 
        fontWeight: FontWeight.w900,
      ),
    ),
    Text(
      date,
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
              height: 200,
              width: 290,
             child:  Image.asset(
          image,
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
                      title,
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
              Text(releaseDate),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(height: 30), // Add some spacing between list items
      ],
    );
  }
}
