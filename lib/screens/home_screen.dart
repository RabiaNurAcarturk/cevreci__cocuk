import 'package:cevreci_cocuk/screens/badges_screen.dart';
import 'package:cevreci_cocuk/screens/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:cevreci_cocuk/screens/journal_screen.dart';
import 'package:cevreci_cocuk/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: DiscoverScreen()),   
    Center(child: BadgesScreen()), 
    Center(child: JournalScreen()),   
    Center(child: ProfileScreen()),   
  ];

  final List<String> _titles = [
    'Keşfet',
    'Görevler',
    'Günlük',
    'Profil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Keşfet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Görevler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Günlük',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
