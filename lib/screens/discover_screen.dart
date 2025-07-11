import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = '/discover';

  final List<Map<String, String>> natureItems = [
    {
      'resim': 'assets/sun.png',
      'baslik': '☀️Güneş Panelli Bir Ev ve Elektrikli Araba',
      'aciklama': 'Evlerimizin çatıları pırıl pırıl güneş panelleriyle dolu! Güneş, Rabbimizin bize armağanı, tertemiz ve sınırsız bir enerji kaynağı. Bu paneller sayesinde evlerimize Rabbimizin bahşettiği güneş enerjisiyle elektrik sağlıyoruz. Elektrikli arabalarla da havayı kirletmeden, Allah\'ın yarattığı bu güzel dünyada gezebiliriz. Böylece, hem çevremizi koruruz hem de geleceğimizi aydınlatırız! Unutma, atacağımız küçük adımlar bile büyük farklar doğurur!',
    },
    {
      'resim': 'assets/fidan.png',
      'baslik': '🌱Dünya Çocuklarının Beraber Fidan Diktiği Bir Orman',
      'aciklama': 'Minik ellerden çıkan kocaman bir orman! Ağaçlar, havayı temizler ve bize taze nefes aldırır. Hadi sen de bir ağaç dik, yeni arkadaşlar edin ve gezegenimizin süper kahramanı ol! Her yeni fidan, dünyamız için bir umut demektir.',
      'hadis': 'bir hadis: “Müslüman bir kişi bir ağaç diker de ondan insan, hayvan veya kuş yerse, bu yenen şey kıyamet gününe kadar o Müslüman için sadaka olur." (Müslim, Müsâkât 10)',
    },
    {
      'resim':'assets/paper.png',
      'baslik':'Geri Dönüşüm ♻🚮',
      'aciklama':'Çöplerimize yeni bir hayat verelim! Kaynaklarımızı israf etmeyelim. Kağıt, plastik, cam... Her biri farklı bir kutuya giriyor ve yepyeni şeyler oluyor. Eski bir şişeden harika bir oyuncak bile yapılabilir! Unutma, çöpleri ayırmak, Rabbimizin bize emanet ettiği dünyamızın sağlığı için attığımız minik ama çok önemli bir adımdır.',
      'ayet':'bir ayet: "Yiyin için fakat israf etmeyin. Çünkü O, israf edenleri sevmez." (A’raf 31.ayet)',
    },
    {
      'resim':'assets/brashes.png',
      'baslik':'💧SU💧',
      'aciklama':'Rabbimizin bize nimet olarak verdiği suları boşa harcamayalım! Dişlerimizi fırçalarken, elimizi yıkarken musluğu açık bırakmıyor, sadece ihtiyacımız kadar kullanıyoruz. Unutmayalım, temiz su bulamayan nice insan var! ',
    },
    {
      'resim':'assets/bicycle.png',
      'baslik':'🚴🏻🚶🏻Yürümek veya Hareket Etmek',
      'aciklama':'Haydi, pedallara kuvvet! Kısa mesafelerde yürüyerek veya bisikletle giderek hem eğleniriz hem de havayı kirleten gazları azaltırız. Hem spor yaparız hem de dünyamızı koruruz. En güzel yolculuk, temiz hava yolculuğu!',
    },
    {
      'resim':'assets/bottle.png',
      'baslik':'Plastik mi Cam mı?🤝',
      'aciklama':'Plastik şişeler yerine kendi su şişemizi yanımızda taşıyarak hem Rabbimizin yarattığı doğayı koruruz hem de sağlıklı kalırız!',
    },
    {
      'resim':'assets/fis.png',
      'baslik':'🔌💡Enerji',
      'aciklama':'Odadan çıkarken ışıkları kapatalım, kullanmadığımız eşyaların fişini çekmeyi unutmayalım. Küçük bir dokunuşla büyük sevaplar kazanabiliriz! ',
    },
    { 
      'resim':'assets/earth.png',
      'baslik':'Doğayı Sevmek🌍',
      'aciklama':'Dünya hepimizin evi! Rabbimizin yarattığı bu güzel gezegeni korumak için birlikte çalışmalıyız. Farklı yerlerde olsak da aynı gökyüzünün altındayız. Doğa dostu minikler olarak hepimizin görevi: Dünyayı sev, doğayı koru!',
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
  final Map<String, String> veri;

  const DetaySayfasi({Key? key, required this.veri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(veri['baslik'] ?? ''),
      ),
      body: SingleChildScrollView( // ← EKLENDİ
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
                    color: const Color.fromARGB(255, 255, 247, 5),
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
                      color: Colors.brown[700],
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
