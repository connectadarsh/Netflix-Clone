import 'package:api_sample/view/games_screen.dart';
import 'package:api_sample/view/home_screeen.dart';
import 'package:api_sample/view/my_netflix_screen.dart';
import 'package:api_sample/view/new_hot._screen.dart';
import 'package:flutter/material.dart';

class ControlBottom extends StatefulWidget {
  const ControlBottom({super.key});

  @override
  State<ControlBottom> createState() => _ControlBottomState();
}

class _ControlBottomState extends State<ControlBottom> {
    int _currentIndex=0;
  final List _pages=[
        HomeScreen(),
        GamesScreen(),
        NewHot(),
        MyNetflix(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      
      _pages[_currentIndex],
      
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),
            BottomNavigationBarItem(icon: Icon(Icons.games_outlined),
            label: 'Games',
            
          ),
            BottomNavigationBarItem(icon: Icon(Icons.explore),
            label: 'New & Hot',
            
          ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: 'Profile',
            
          ),
        ],
      ),
    );
  }
}