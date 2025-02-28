// import 'package:flutter/material.dart';

// class NewHot extends StatefulWidget {
//   const NewHot({super.key});

//   @override
//   State<NewHot> createState() => _NewHotState();
// }

// class _NewHotState extends State<NewHot> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title:Text('New & Hot'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.download),
//             onPressed: () {},
//           ),
//           SizedBox(width: 8,),
//             IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//         // centerTitle: true,
//       ),
//       body:
//       SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(

//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('Release \n Date '),
//                 SizedBox(width: 12,),
//                 Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                   children:  [
//                     Container(
//                       height: 200,
//                       width: 290,
//                       color: Colors.amber,
//                     ),
//                     SizedBox(height: 15,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text('The wild')
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       )
//       ,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NewHot extends StatefulWidget {
//   const NewHot({super.key});

//   @override
//   State<NewHot> createState() => _NewHotState();
// }

// class _NewHotState extends State<NewHot> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text('New & Hot'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.download),
//             onPressed: () {},
//           ),
//           SizedBox(
//             width: 8,
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//         // centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Release \n Date '),
//               SizedBox(
//                 width: 12,
//               ),
//               Container(
//                 height: 200,
//                 width: 290,
//                 color: Colors.amber,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 5 + 65.0),
//                 child: Text(
//                   'Basic Instinct',
//                   style: GoogleFonts.openSans(
//                     fontSize: 25,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),
//                 Spacer(), 
//               Icon(Icons.notifications_none),
//               SizedBox(width: 12), 
//               Icon(Icons.info_outline),
//               SizedBox(width: 10),
//             ],
            
//           ),
//           SizedBox(height: 20,),
//           Padding(
//             padding: EdgeInsets.only(right: 85),
//             child: Text('Coming on sept 12'),
//           ),
//            SizedBox(height: 20,),
//           Padding(
//             padding: EdgeInsets.only(right: 85),
//             child: Text("Detective Nick is tasked with investigating the murder of Johnny Boz. He suspects Johnny's girlfriend Catherine to be responsible for the act. However, things take a turn when he falls for her.",
//             style: TextStyle(
//               fontSize: 12
//             ),
//             ),
//           )
//         ],
        
//         ),
        
        
//       ),
//     );
//   }
// }

// import 'package:api_sample/widgets/new_hot_content.dart';
// import 'package:flutter/material.dart';


// class NewHot extends StatefulWidget {
//   const NewHot({super.key});

//   @override
//   State<NewHot> createState() => _NewHotState();
// }

// class _NewHotState extends State<NewHot> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text('New & Hot'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.download),
//             onPressed: () {},
//           ),
//           SizedBox(width: 8),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: const NewHotContent(),
//     );
//   }
// }


import 'package:api_sample/widgets/new_hot_content.dart';
import 'package:flutter/material.dart';

class NewHot extends StatefulWidget {
  const NewHot({super.key});

  @override
  State<NewHot> createState() => _NewHotState();
}

class _NewHotState extends State<NewHot> {
  // Sample data - in a real app, this would come from an API
  final List<Map<String, String>> movieData = [
    {
      'title': 'Basic Instinct',
      'releaseDate': 'Coming on Sept 12',
      'description': "Detective Nick is tasked with investigating the murder of Johnny Boz. He suspects Johnny's girlfriend Catherine to be responsible for the act. However, things take a turn when he falls for her.",
      'Image':'assets/basic.jpeg',
      'month':'sep',
      'date':'12'     
    },
    {
      'title': 'The Shawshank Redemption',
      'releaseDate': 'Coming on Oct 5',
      'description': "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
      'Image':'assets/apo.jpeg',
      'month':'sep',
      'date':'13'    
    },
    {
      'title': 'The Godfather',
      'releaseDate': 'Coming on Nov 18',
      'description': "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
      'Image':'assets/MH.jpeg',
      'month':'sep',
      'date':'14'    
    },
    // Add more movies as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('New & Hot'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {},
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: movieData.length,
        itemBuilder: (context, index) {
          return NewHotContent(
            title: movieData[index]['title'] ?? '',
            releaseDate: movieData[index]['releaseDate'] ?? '',
            description: movieData[index]['description'] ?? '',
            image:movieData[index]['Image']?? '',
            month: movieData[index]['month']??'',
            date: movieData[index]['date']??'',
          );
        },
      ),
    );
  }
}

