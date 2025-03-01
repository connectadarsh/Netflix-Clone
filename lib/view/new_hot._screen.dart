import 'package:api_sample/controller/services.dart';
import 'package:api_sample/model/movie_model.dart';
import 'package:api_sample/widgets/new_hot_content.dart';
import 'package:flutter/material.dart';

class NewHot extends StatefulWidget {
  const NewHot({super.key});

  @override
  State<NewHot> createState() => _NewHotState();
}

class _NewHotState extends State<NewHot> {
  final TMDBService service = TMDBService();
  late Future<List<Movie>> _new;

  @override
  void initState() {
    super.initState();
    _new = toprated();
  }

  Future<List<Movie>> toprated() async {
    try {
      final results = await service.toprated();
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('New & Hot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: _new,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Error loading movies"));
          }

          List<Movie> movies = snapshot.data!;

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Movie movie = movies[index];
              return NewHotContent(
                title: movie.title, 
                releaseDate: movie.releasedate, 
                description: movie.title,
                image: movie.posterPath, 
                month: movie.releasedate, 
                date: movie.releasedate, 
                overview:movie.overview,
              );
            },
          );
        },
      ),
    );
  }
}



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

