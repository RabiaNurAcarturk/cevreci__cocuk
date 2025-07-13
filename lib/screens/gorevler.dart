import 'package:flutter/material.dart';
import 'package:cevreci_cocuk/utils/gorev_sayaci.dart';

class GorevlerSayfasi extends StatefulWidget {
  @override
  _GorevlerSayfasiState createState() => _GorevlerSayfasiState();
}

class _GorevlerSayfasiState extends State<GorevlerSayfasi> {
  final List<Map<String, dynamic>> gorevler = [
    {'metin': 'Bugün musluğu açık bırakmadım', 'tamamlandi': false},
    {'metin': 'Çöpleri geri dönüşüm kutularına ayırdım', 'tamamlandi': false},
    {'metin': 'Bir arkadaşımı çevre konusunda bilgilendirdim', 'tamamlandi': false},
    {'metin': 'Bugün gereksiz ışıkları kapattım', 'tamamlandi': false},
    {'metin': 'Ağaçlara zarar vermedim, çiçekleri korudum', 'tamamlandi': false},
    {'metin': 'Plastik poşet yerine bez çanta kullandım', 'tamamlandi': false},
    {'metin': 'Çöpü çöp kutusuna attım.', 'tamamlandi': false},
    {'metin': 'Kağıt israfı yapmadım, iki tarafını da kullandım', 'tamamlandi': false},
    {'metin': 'Bugün dışarda hayvanlara su veya mama verdim', 'tamamlandi': false},
    {'metin': 'Musluğu açık bırakma', 'tamamlandi': false},
    {'metin': 'Elektrikleri gereksiz yere açma', 'tamamlandi': false},
    {'metin': 'Yerlere çöp atmadım, atanları uyardım', 'tamamlandi': false},
  ];

  void goreviGuncelle(int index, bool? yeniDeger) {
    setState(() {
      gorevler[index]['tamamlandi'] = yeniDeger!;
      GorevSayaci.tamamlananGorevSayisi =
       gorevler.where((g) => g['tamamlandi']).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              'Bugün ${GorevSayaci.tamamlananGorevSayisi} görev tamamladın!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: gorevler.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: CheckboxListTile(
                      title: Text(gorevler[index]['metin']),
                      value: gorevler[index]['tamamlandi'],
                      activeColor: Colors.green,
                      onChanged: (deger) {
                        goreviGuncelle(index, deger);
                        if (deger == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Harika! Görevi tamamladın 🎉'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}