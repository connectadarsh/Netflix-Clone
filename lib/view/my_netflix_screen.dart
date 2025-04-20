import 'package:flutter/material.dart';

class MyNetflix extends StatefulWidget {
  const MyNetflix({super.key});

  @override
  State<MyNetflix> createState() => _MyNetflixState();
}

class _MyNetflixState extends State<MyNetflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Netflix'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          SizedBox(
            width: 8,
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
        // centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Center(
            child: Container(
                height: 95,
                width: 70,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'assets/profile net.png',
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }
}
