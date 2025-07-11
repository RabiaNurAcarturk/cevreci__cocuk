import 'package:flutter/material.dart';
import 'package:cevreci_cocuk/utils/gorev_sayaci.dart';

class BadgesScreen extends StatefulWidget {
  static const String routeName = '/badges';

  @override
  _BadgesScreenState createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _sizeAnimations;

  int completedTasks = GorevSayaci.tamamlananGorevSayisi;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      ),
    );

    _sizeAnimations = _controllers
        .map((controller) =>
            Tween<double>(begin: 70, end: 200).animate(CurvedAnimation(
              parent: controller,
              curve: Curves.easeOut,
              reverseCurve: Curves.easeIn,
            )))
        .toList();
  }

  void _animateBadge(int index) {
    _controllers[index].forward().then((_) {
      Future.delayed(Duration(milliseconds: 280), () {
        _controllers[index].reverse();
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BadgeModel> badges = [
      BadgeModel(
        title: 'Adım Rozeti',
        level: 'Seviye 1',
        description: '3 görev ile kazanıldı.',
        imagePath: 'assets/rozet1.png',
        isEarned: completedTasks >= 3,
      ),
      BadgeModel(
        title: 'Adım Rozeti',
        level: 'Seviye 2',
        description: '5 görev ile kazanıldı.',
        imagePath: 'assets/rozet3.png',
        isEarned: completedTasks >= 5,
      ),
      BadgeModel(
        title: 'Adım Rozeti',
        level: 'Seviye 3',
        description: '10 görev ile kazanıldı.',
        imagePath: 'assets/rozet2.png',
        isEarned: completedTasks >= 10,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: badges.length,
        itemBuilder: (context, index) {
          final badge = badges[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: badge.isEarned ? () => _animateBadge(index) : null,
                  child: AnimatedBuilder(
                    animation: _sizeAnimations[index],
                    builder: (context, child) {
                      return Opacity(
                        opacity: badge.isEarned ? 1.0 : 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            badge.imagePath,
                            width: _sizeAnimations[index].value,
                            height: _sizeAnimations[index].value,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(badge.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      Text(badge.level,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13)),
                      Text(badge.description,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BadgeModel {
  final String title;
  final String level;
  final String description;
  final String imagePath;
  final bool isEarned;

  BadgeModel({
    required this.title,
    required this.level,
    required this.description,
    required this.imagePath,
    required this.isEarned,
  });
}