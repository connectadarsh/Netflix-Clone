import 'package:flutter/material.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Games'),
        actions: [
            IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        // centerTitle: true,
      ),
    );
  }
}