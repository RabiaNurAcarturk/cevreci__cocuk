import 'package:cevreci_cocuk/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cevreci_cocuk/utils/app_strings.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = '/discover';

  final List<Map<String, dynamic>> natureItems = [
    {
      'resim': 'assets/sun.png',
      'baslik': AppStrings.solarTitle,
      'aciklama': AppStrings.solarDesc,
    },
    {
      'resim': 'assets/fidan.png',
      'baslik': AppStrings.forestTitle,
      'aciklama': AppStrings.forestDesc,
      'hadis': AppStrings.forestHadis,
    },
    {
      'resim':'assets/paper.png',
      'baslik': AppStrings.recycleTitle,
      'aciklama': AppStrings.recycleDesc,
      'ayet': AppStrings.recyleAyet,
    },
    {
      'resim':'assets/brashes.png',
      'baslik': AppStrings.waterTitle,
      'aciklama': AppStrings.waterDesc,
    },
    {
      'resim':'assets/bicycle.png',
      'baslik': AppStrings.bikeTitle,
      'aciklama': AppStrings.bikeDesc,
    },
    {
      'resim':'assets/bottle.png',
      'baslik': AppStrings.bottleTitle,
      'aciklama': AppStrings.bottleDesc,
    },
    {
      'resim':'assets/fis.png',
      'baslik': AppStrings.energyTitle,
      'aciklama': AppStrings.energyDesc,
    },
    { 
      'resim':'assets/earth.png',
      'baslik': AppStrings.loveNatureTitle,
      'aciklama': AppStrings.loveNatureDesc,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  final Map<String, dynamic> veri;

  const DetaySayfasi({Key? key, required this.veri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(veri['baslik'] ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              if (veri.containsKey('ayet'))
                Text(
                  veri['ayet']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (veri.containsKey('hadis')) // ← Hadis varsa göster
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    veri['hadis']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: AppColors.hadisColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
