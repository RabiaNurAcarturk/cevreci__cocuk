import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = '/discover';

  final List<Map<String, String>> natureItems = [
    {
      'resim': 'assets/flower.jpg',
      'baslik': 'Renklerdeki Sanat',
      'aciklama': 'Gülün katmanlarını incele... Ne kadar ince, düzenli ve güzel yaratılmış.',
      'ayet': '“O ki, yarattığı her şeyi güzel yaptı.” (Secde 7)',
    },
    {
      'resim': 'assets/mountain.jpg',
      'baslik': 'Dağların Heybeti',
      'aciklama': 'Dağlar yeryüzünü sabitleyen dev sütunlar gibidir. Bu düzen bir tesadüf olamaz.',
      'ayet': '“dağları da birer kazık yapmadık mı?” (Nebe 7)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keşfet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: natureItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final dogal = natureItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetaySayfasi(veri: dogal),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          natureItems[index]['resim']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        dogal['baslik'] ?? '',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetaySayfasi extends StatelessWidget {
  final Map<String, String> veri;

  const DetaySayfasi({Key? key, required this.veri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(veri['baslik'] ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(veri['resim'] ?? ''),
            const SizedBox(height: 16),
            Text(
              veri['aciklama'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              veri['ayet'] ?? '',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.green[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
