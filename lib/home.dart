import 'package:flutter/material.dart';
import 'package:uas_miftakhul/homepage.dart';
import './notes.dart';
import './profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavCurrentIndex = 0;

  // Halaman
  final List<Widget> _pages = [
    const HomePage(),
    const NotePage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavCurrentIndex,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
