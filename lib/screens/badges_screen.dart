import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
static const String routeName = '/badges';

final List<BadgeModel> badges = [
BadgeModel(
title: 'Adım Rozeti',
level: 'Seviye 1',
description: '3 görevi yerine getirerek bu rozeti kazandınız :)',
imagePath: 'assets/rozet1.png',

),
BadgeModel(
title: 'Adım Rozeti',
level: 'Seviye 2',
description: ' görevi yerine getirerek bu rozeti kazandınız.',
imagePath: 'assets/rozet3.png',
),
BadgeModel(
title: 'Adım Rozeti',
level: 'Seviye 3',
description: ' görevi yerine getirerek bu rozeti kazandınız.',
imagePath: 'assets/rozet2.png',
),
];

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
backgroundColor: Colors.white,
elevation: 0,
centerTitle: true,
leading: IconButton(
icon: Icon(Icons.arrow_back, color: Colors.black),
onPressed: () => Navigator.pop(context),
),
title: Text(
'Rozetler',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Colors.black,
),
),
),
body: ListView.builder(
itemCount: badges.length,
itemBuilder: (context, index) {
final badge = badges[index];
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child: Row(
children: [
ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: Image.asset(
    badge.imagePath,
    width: 70,
    height: 70,
    fit: BoxFit.cover,
  ),
),

const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(badge.title,
style: TextStyle(fontWeight: FontWeight.w600)),
Text(badge.level,
style:
TextStyle(color: Colors.grey.shade600, fontSize: 13)),
Text(badge.description,
style:
TextStyle(color: Colors.grey.shade600, fontSize: 13)),
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

BadgeModel({
required this.title,
required this.level,
required this.description,
required this.imagePath,
});
}
