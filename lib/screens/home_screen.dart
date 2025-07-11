import 'package:cevreci_cocuk/screens/badges_screen.dart';
import 'package:cevreci_cocuk/screens/discover_screen.dart';
import 'package:cevreci_cocuk/screens/journal_screen.dart';
import 'package:cevreci_cocuk/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:star_menu/star_menu.dart';
import 'package:cevreci_cocuk/screens/gorevler.dart';
import 'package:cevreci_cocuk/screens/login_screen.dart';
import 'package:cevreci_cocuk/screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DiscoverScreen(),
    BadgesScreen(),
    JournalScreen(),
    ProfileScreen(),
    GorevlerSayfasi()
  ];

  final List<String> _titles = [
    'Keşfet',
    'Rozetlerim',
    'Günlüğüm',
    'Profilim',
    'Görevlerim'
  ];

  void _onMenuItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> menuItems = List.generate(5, (index) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: const Color.fromARGB(255, 255, 247, 4),
            heroTag: 'star_menu_item_$index',
            onPressed: () {
              _onMenuItemTapped(index);
            },
            child: Icon(
              [
                Icons.explore,
                Icons.badge,
                Icons.edit,
                Icons.person,
                Icons.check_circle
              ][index],
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _titles[index],
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 248, 139),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: StarMenu(
        params: const StarMenuParameters(
          shape: MenuShape.circle,
          animationCurve: Curves.easeInOut,
          openDurationMs: 300,
          closeDurationMs: 200,
          backgroundParams: BackgroundParams(
  backgroundColor: Colors.transparent,
),
        ),
        items: menuItems,
        child: FloatingActionButton(
          onPressed: null,
          backgroundColor: const Color.fromARGB(255, 255, 247, 4),
          child: const Icon(Icons.star),
        ),
      ),
    );
  }
}