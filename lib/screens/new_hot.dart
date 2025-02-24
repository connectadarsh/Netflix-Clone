import 'package:flutter/material.dart';

class NewHot extends StatefulWidget {
  const NewHot({super.key});

  @override
  State<NewHot> createState() => _NewHotState();
}

class _NewHotState extends State<NewHot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Text('New & Hot'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {},
          ),
          SizedBox(width: 8,),
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