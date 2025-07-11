import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  final String userName = 'Çevre Dostu Zeynep'; // Bu ileride TextField ile değiştirilebilir
  final int completedTasks = 7;
  final int earnedBadges = 2;

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
                  backgroundColor: Colors.green.shade300,
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
                  label: 'Görev Tamamlandı',
                  value: completedTasks.toString(),
                ),
                _InfoCard(
                  icon: Icons.emoji_events,
                  label: 'Rozet Alındı',
                  value: earnedBadges.toString(),
                ),
              ],
            ),

            SizedBox(height: 32),

            // Açıklama
            Text(
              '📱 Uygulama Hakkında',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Bu uygulama çocuklara iklim duyarlılığı, çevre sevgisi ve manevî bakış açısı kazandırmak için geliştirilmiştir. '
              'Her gün minik görevler yaparak çevreyi koruyabilir, Allah’ın (c.c.) yarattığı güzellikleri daha yakından görebilirsin 🍃',
              style: TextStyle(fontSize: 15),
            ),

            Spacer(),

            Center(
              child: Text(
                'v1.0 • Çevreci Çocuk',
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
            Icon(icon, size: 32, color: Colors.green),
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