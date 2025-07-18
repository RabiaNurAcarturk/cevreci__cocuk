import 'package:cevreci_cocuk/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:cevreci_cocuk/utils/gorev_sayaci.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String userName = AppStrings.userName;

  int get completedTasks => GorevSayaci.tamamlananGorevSayisi;

  int get earnedBadges {
    if (completedTasks >= 10) return 3;
    if (completedTasks >= 5) return 2;
    if (completedTasks >= 3) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kullanıcı Bilgisi
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: const Color(0xFFFCDC2A),
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(width: 16),
                Text(
                  userName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Tamamlanan Görevler ve Rozetler
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _InfoCard(
                  icon: Icons.check_circle,
                  label: AppStrings.tasksCompleted,
                  value: completedTasks.toString(),
                ),
                _InfoCard(
                  icon: Icons.emoji_events,
                  label: AppStrings.badgesEarned,
                  value: earnedBadges.toString(),
                ),
              ],
            ),

            SizedBox(height: 32),

            // Açıklama
            Text(AppStrings.aboutTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(AppStrings.aboutDescription,
              style: TextStyle(fontSize: 15),
            ),

            Spacer(),

            Center(
              child: Text(AppStrings.versionInfo,
               style: TextStyle(color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: const Color.fromARGB(255, 94, 76, 175)),
            SizedBox(height: 8),
            Text(value,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 4),
            Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
