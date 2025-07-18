//kodu tek yerden yönetmeK+ileride çok dilli destek (localization) için bu sayfa oluşturuldu.
//homescreen
abstract class AppStrings {
  static const discover = "Keşfet";
  static const badges = "Rozetlerim";
  static const journal = "Günlüğüm";
  static const profile = "Profilim";
  static const tasks = "Görevlerim";
//badges
  static const badgeTitle = 'Adım Rozeti';
  static const badgeLevel1 = 'Seviye 1';
  static const badgeLevel2 = 'Seviye 2';
  static const badgeLevel3 = 'Seviye 3';
  static const badgeDesc1 = '3 görev ile kazanıldı.';
  static const badgeDesc2 = '5 görev ile kazanıldı.';
  static const badgeDesc3 = '10 görev ile kazanıldı.';
//discover
static const solarTitle = '☀️Güneş Panelli Bir Ev ve Elektrikli Araba';
static const solarDesc = 'Evlerimizin çatıları pırıl pırıl güneş panelleriyle dolu! Güneş bize bir armağan, tertemiz ve sınırsız bir enerji kaynağı. Bu paneller sayesinde evlerimize Güneş enerjisiyle elektrik sağlıyoruz. Elektrikli arabalarla da havayı kirletmeden, Allahımızın yarattığı bu güzel dünyada gezebiliriz. Böylece hem çevremizi koruruz hem de geleceğimizi aydınlatırız! Unutma, atacağımız küçük adımlar bile büyük farklar doğurur!';

static const forestTitle = '🌱Dünya Çocuklarının Beraber Fidan Diktiği Bir Orman';
static const forestDesc = 'Minik ellerden çıkan kocaman bir orman! Ağaçlar, havayı temizler ve bize taze nefes aldırır. Hadi sen de bir ağaç dik, yeni arkadaşlar edin ve gezegenimizin süper kahramanı ol! Her yeni fidan, dünyamız için bir umut demektir.';
static const forestHadis = 'bir hadis: “Müslüman bir kişi bir ağaç diker de ondan insan, hayvan veya kuş yerse, bu yenen şey kıyamet gününe kadar o Müslüman için sadaka olur." (Müslim, Müsâkât 10)';

static const recycleTitle = 'Geri Dönüşüm ♻🚮';
static const recycleDesc = 'Çöplerimize yeni bir hayat verelim! Kaynaklarımızı israf etmeyelim. Kağıt, plastik, cam... Her biri farklı bir kutuya giriyor ve yepyeni şeyler oluyor. Eski bir şişeden harika bir oyuncak bile yapılabilir! Unutma, çöpleri ayırmak, Rabbimizin bize emanet ettiği dünyamızın sağlığı için attığımız minik ama çok önemli bir adımdır.';
static const recyleAyet = 'bir ayet: "Yiyin için fakat israf etmeyin. Çünkü O, israf edenleri sevmez." (A’raf 31.ayet)';

static const waterTitle = '💧SU💧';
static const waterDesc = 'Rabbimizin bize nimet olarak verdiği suları boşa harcamayalım! Dişlerimizi fırçalarken, elimizi yıkarken musluğu açık bırakmıyor, sadece ihtiyacımız kadar kullanıyoruz. Unutmayalım, temiz su bulamayan nice insan var! ';

static const bikeTitle = '🚴🏻🚶🏻Yürümek veya Hareket Etmek';
static const bikeDesc = 'Haydi, pedallara kuvvet! Kısa mesafelerde yürüyerek veya bisikletle giderek hem eğleniriz hem de havayı kirleten gazları azaltırız. Hem spor yaparız hem de dünyamızı koruruz. En güzel yolculuk, temiz hava yolculuğu!';

static const bottleTitle = 'Plastik mi Cam mı?🤝';
static const bottleDesc = 'Plastik şişeler yerine kendi su şişemizi yanımızda taşıyarak hem Rabbimizin yarattığı doğayı koruruz hem de sağlıklı kalırız!';

static const energyTitle = '🔌💡Enerji';
static const energyDesc = 'Odadan çıkarken ışıkları kapatalım, kullanmadığımız eşyaların fişini çekmeyi unutmayalım. Küçük bir dokunuşla büyük sevaplar kazanabiliriz! ';

static const loveNatureTitle = 'Doğayı Sevmek🌍';
static const loveNatureDesc = 'Dünya hepimizin evi! Rabbimizin yarattığı bu güzel gezegeni korumak için birlikte çalışmalıyız. Farklı yerlerde olsak da aynı gökyüzünün altındayız. Doğa dostu minikler olarak hepimizin görevi: Dünyayı sev, doğayı koru!';
  
//görevler
static const gorevBaslik = 'Bugün tamamladığın görev sayısı:';

static const List<String> gorevMetinleri = [
   'Bugün musluğu açık bırakmadım',
   'Çöpleri geri dönüşüm kutularına ayırdım',
   'Bugün dışarda hayvanlara su veya mama verdim',
   'Bir arkadaşımı çevre konusunda bilgilendirdim',
   'Bugün gereksiz ışıkları kapattım',
   'Kağıt israfı yapmadım, iki tarafını da kullandım',
   'Ağaçlara zarar vermedim, çiçekleri korudum',
   'Plastik poşet yerine bez çanta kullandım',
   'Yerlere çöp atmadım, atanları uyardım',
   'Elektrikleri gereksiz yere açmadım',
   'Musluğu açık bırakmadım',
   'Çöpü çöp kutusuna attım.',
];
static const String gorevTamamlandiMesaji = 'Harika! Görevi tamamladın 🎉';

//main
static const appTitle = 'Çevreci Çocuk';

//journal
static const journalTasksLabel = 'Bugün ne yaptın?';
static const journalFeelingLabel = 'Neler hissettin?';
static const journalSaveButton = 'Kaydet';
static const journalEmptyMessage = 'Henüz günlük kaydı yok.';

//login
static const usernameHint = 'Kullanıcı Adı';
static const passwordHint = 'Şifre';
static const loginButton = "Giriş Yap";
static const googleLoginButton = "Google ile Giriş Yap";
static const registerButton = "Kaydol";
static const loginErrorTitle = "Hatalı Giriş";
static const loginErrorMessage = "Kullanıcı adı veya şifre yanlış.";
static const okButton = "Tamam";

//profile
static const userName = 'Çevre Dostu Zeynep';

static const tasksCompleted = 'Görev Tamamlandı';
static const badgesEarned =  'Rozet Alındı';

static const aboutTitle = '📱 Uygulama Hakkında';
static const aboutDescription = 'Bu uygulama çocuklara iklim duyarlılığı, çevre sevgisi ve manevî bakış açısı kazandırmak için geliştirilmiştir. '
              'Her gün minik görevler yaparak çevreyi koruyabilir, Allah’ın (c.c.) yarattığı güzellikleri daha yakından görebilirsin🍃';

static const versionInfo = 'v1.0 • Çevreci Çocuk';
  }
