import 'package:flutter/material.dart';
import 'package:cevreci_cocuk/utils/gorev_sayaci.dart';
import 'package:cevreci_cocuk/utils/app_strings.dart';

class GorevlerSayfasi extends StatefulWidget {
  @override
  _GorevlerSayfasiState createState() => _GorevlerSayfasiState();
}

class _GorevlerSayfasiState extends State<GorevlerSayfasi> {
  late List<Map<String, dynamic>> gorevler;
   @override
   void initState(){
    super.initState();
    gorevler = AppStrings.gorevMetinleri.map((metin){
      return {'metin': metin, 'tamamlandi': false};
    }).toList();
   }

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
              '${AppStrings.gorevBaslik} ${GorevSayaci.tamamlananGorevSayisi}',
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
                              content: Text(AppStrings.gorevTamamlandiMesaji),
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