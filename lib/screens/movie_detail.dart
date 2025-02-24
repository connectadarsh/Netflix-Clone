import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  'assets/basic.jpeg',
                  fit: BoxFit.cover,
                  height: 35,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/Netflix N.png',
                        fit: BoxFit.cover,
                        height: 35,
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'M O V I E',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Basic Instinct',
                    style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '2024   Rating 6.0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          iconColor: Colors.black,
                          minimumSize: const Size(400, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Play',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          iconColor: Colors.white,
                          minimumSize: const Size(400, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 87, 94, 97),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Download',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Detective Nick is tasked with investigating the murder of Johnny Boz. He suspects Johnny's girlfriend Catherine to be responsible for the act. However, things take a turn when he falls for her."),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('More Like This',
                      style: GoogleFonts.openSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      )),
                  const SizedBox(height: 32),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/apo.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
