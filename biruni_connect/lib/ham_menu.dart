import 'package:biruni_connect/main.dart';
import 'package:flutter/material.dart';
import 'ayarlar.dart';
import 'SanalTur/sanal_tur.dart';
import 'package:url_launcher/url_launcher.dart';
import 'InfoButtons/akademik_takvim_page.dart';
import 'kampus_rebher.dart';

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  String _selectedCategory = 'Kampüs Hakkında'; // İlk dropdown başlangıç değeri
  String _selectedSettings = 'Ayarlar'; // İkinci dropdown başlangıç değeri

  final TextStyle menuTextStyle = TextStyle(
    fontSize: 16.0, // Menü öğeleriyle aynı yazı boyutu
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Menü Başlığı
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Biruni Connect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Ana Sayfa Butonu
          ListTile(
            title: const Text('Ana Sayfa', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context); // Menüyü kapat
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          // Akademik Programlar Butonu
          ListTile(
            title: const Text('Akademik Programlar',
                style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context); // Menüyü kapat
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AkademikTakvimPage()),
              );
            },
          ),
          // İlk Dropdown (Kategoriler)
          ListTile(
            title: Row(
              children: [
                const Text('', style: TextStyle(fontSize: 16.0)),
                DropdownButton<String>(
                  value: _selectedCategory, // Varsayılan değer
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  underline: Container(
                    height: 2,
                    color: Colors.blue,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                    // Seçilen kategoriye göre işlem yapılabilir
                    switch (newValue) {
                      case 'Kampüs Hakkında':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KampusHakkindaPage()),
                        );
                        break;
                      case 'Sanal Tur':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sanal()),
                        );
                        break;
                      case 'Kampüs Rehberi':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KampusRehberi()),
                        );
                        break;
                    }
                  },
                  items: <String>[
                    'Kampüs Hakkında',
                    'Sanal Tur',
                    'Kampüs Rehberi'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Öğrenci Bilgi Sistemi',
                style: TextStyle(fontSize: 16.0)),
            onTap: () async {
              Navigator.pop(context); // Menüyü kapat
              final url = 'https://sis.biruni.edu.tr';
              if (await canLaunch(url)) {
              await launch(url);
              } else {
              throw 'URL açılamadı: $url';
              }
            },
          ),
          ListTile(
            title: const Text('Kayıt Sistemi',
                style: TextStyle(fontSize: 16.0)),
            onTap: () async {
              Navigator.pop(context); // Menüyü kapat
              final url = 'https://malikayit.biruni.edu.tr';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'URL açılamadı: $url';
              }
            },
          ),
          // İkinci Dropdown (Ayarlar)
          ListTile(
            title: const Text('Ayarlar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AyarlarPage()),
              );
            },
          ),
          ListTile(
            title: const Text('İletişim ve Destek'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IletisimDestekPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Hakkımızda'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HakkimizdaPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Başvuru ve Kayıt Sayfası
class BasvuruKayitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Başvuru ve Kayıt'),
      ),
      body: const Center(
        child: Text('Başvuru ve Kayıt İçeriği'),
      ),
    );
  }
}

// Sayfa 5: İletişim ve Destek
class IletisimDestekPage extends StatelessWidget {
  @override
  _launchURL() async {
    const url = 'https://www.google.com/maps/place/Biruni+%C3%9Cniversitesi/@41.0187784,28.9154234,16z/data=!4m6!3m5!1s0x14cabbb1ade07b4d:0x41372ea4b54356d2!8m2!3d41.0178922!4d28.9164256!16s%2Fg%2F1q5jpwm52?entry=ttu&g_ep=EgoyMDI0MTIxMS4wIKXMDSoASAFQAw%3D%3D';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Bu URL açılamadı: $url';
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İletişim ve Destek'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🚩 Merkezefendi Mahallesi G/75 Sk. No: 1-13 Zeytinburnu/İstanbul',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '☎️ Telefon: 444 8 276 (BRN)',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '📞 Telefon: +90 212 416 46 46',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '📧 E-posta: biruniuniv@hs01.kep.tr',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '📧 E-posta: info@biruni.edu.tr',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

// Sayfa 6: Hakkımızda
// Sayfa 6: Hakkımızda
class HakkimizdaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Biruni Kimdir?'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BiruniKimdirPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tarihçe'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TarihcePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Misyon ve Vizyon'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MisyonVizyonPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Amaç'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AmacPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Kurucu Vakıf'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KurucuVakifPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Rektörün Mesajı'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RektorMesajiPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Stratejik Plan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StratejikPlanPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Kalite Politikası'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KalitePlaniPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Ek sayfa sınıfları (şablon olarak bırakılmıştır)
class BiruniKimdirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biruni Kimdir?'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          SizedBox(height: 20),
          Text(
            'Dünyada bilim sahasına kazandırdığı ilk keşif ve buluşlarla, bilim dünyasına ışık tutan Türk-İslam alimi el-Biruni; fizik, tıp, matematik, astronomi, trigonometri, coğrafya, jeodezi, farmakoloji, jeoloji, filoloji, din gibi konuları incelemiş ve toplamda 113 eser meydana getirmiştir.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'Ebu Reyhân Muhammed b. Ahmed el-Biruni h. 3 Zilhicce 362 / m. 4 Eylül 973 tarihinde Harezm bölgesinin merkezi olan Kas’ta dünyaya gelmiştir. el-Biruni’nin vefat tarihi ise tam olarak bilinmemektedir. Bugün araştırmacılar tarafından h. 453 / m. 1061 tarihi Ebu Reyhan Biruni’nin ölüm tarihi olarak kabul edilmektedir. Ayrıca Biruni eserlerinde ailesi, soyu, nisbesi veya etnik kökeni dair detaylı bir malumat da vermemektedir.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'İlk Eğitim Ebu Nasr Mansur’dan\n\nParlak zekâsı sebebiyle daha küçük yaşta nazar-ı dikkati çeken el-Biruni, dönemin ünlü matematik ve astronomi bilgini Ebû Nasr Mansûr b. ‘Alî b. Irâk’ın mahiyetinde büyümüştür. Mansûr, Biruni’nin yetişmesi ve iyi bir eğitim almasına özen göstermiştir. Nitekim el-Biruni, el-Âsârü’l-bâkıye adlı eserinde İbn Irâk’tan “hocam” diye bahsetmektedir...',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'Gençlik yıllarından itibaren bilimsel çalışmalara başlayan el-Biruni, Harezm bölgesinde siyasi ve askeri yönden birtakım karışıklıkların yaşanması münasebetiyle dolayı, 22 yaşına kadar hayatını idame ettirdiği Harezm’i terk etmek zorunda kalmıştır. Bir süreliğine Rey bölgesinde ikâmet eden el-Biruni daha sonra yeniden doğduğu topraklara geri dönüp, kendisini bilim tarihinin zirvesine ulaştıracak eserlerini meydana getirmiştir.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'Birçok alet ve takvim sistemi geliştirdi\n\nEl-Biruni, astronomi ve coğrafya ölçümleri için birçok alet geliştirdi. Ne yazık ki geliştirdiği ölçme aletlerinin birçoğu zaman içerisinde kayboldu. Sadece piknometre, mekanik usturlap ve bazı harita projeksiyonları günümüze kadar ulaşan ölçme araçları oldu...',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'Astronominin temelini attı\n\nHindistan’ın erken ortaçağ bilimlerini betimleyerek, matematik, astronomi ve astrolojinin temellerini anlattı. El-Kanunü’l-Mesudi kitabı ile ayrıntılı bir matematiksel coğrafya eseri yazdı...',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'Denizlerin ardından da kara var!\n\nNewton’dan 700 sene önce, Newton’un matematiksel olarak ispatladığı yerçekimi kuramı üzerine ilk fikirleri El-Biruni ileri sürdü. Geliştirdiği teleskoplar ile gözlemleri sonucunda, gezegenlerin güneş etrafında döndüğünü doğrulayan Galileo’dan 600 sene önce, ‘dünyanın döndüğü’ fikrini El-Biruni savundu...',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            '11. yüzyıla “Biruni Asrı” dendi\n\nX. ve XI. asır Ortaçağ Türk-İslam dünyasını temsil eden Ebu Reyhan el-Biruni bütün hayatını ve varlığını bilime adamış önemli bir şahsiyettir...',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            'Öğrenmekten asla vazgeçmedi\n\nÜnlü Fıkıh bilgini Ebu’l-Hasan el-Velvaleci anlatıyor: “Ebu Reyhan el-Biruni’nin ziyaretine gitmiştim. Canı boğazına gelmiş halde, hasta yatağında tık nefes yatıyordu...”',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20),
          Text(
            '“Orta Asya’da Yaşamış Evrensel Deha”\n\nEl-Biruni, 75 yaşında vefat etti. Kendisinden çok sonra gelen Newton, Toricelli, Copernicus, Galileo gibi bilim adamlarına ilham kaynağı oldu...',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class TarihcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarihçe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Tıp, Eczacılık, Astronomi, Matematik, Fizik, Coğrafya ve Tarih başta olmak üzere birçok alanda önemli eserler vererek dünya bilim tarihine “Evrensel Deha” olarak adını yazdıran Türk bilim insanı Ebu Reyhan El-Biruni’den ilham alarak vakıf üniversiteleri arasında yerini alan Biruni Üniversitesi, tamamı sağlık alanıyla ilgili 6 Fakülte ve 1 Meslek Yüksekokulu ile 2014-2015 eğitim öğretim yılı itibariyle akademik faaliyetlerine başlamıştır.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Biruni Üniversitesi, 27.02.2014 tarihli, 28926 sayılı resmi gazetede yayımlanan, 20.02.2014 kabul tarihli ve 6525 nolu “Bazı Kanun ve Kanun Hükmünde Kararnamelerde Değişiklik Yapılması Hakkında Kanun”un 13. maddesi uyarınca; 28/3/1983 tarihli ve 2809 sayılı Yükseköğretim Kurumları Teşkilatı Kanunu’na eklenen, Ek Madde 156 kapsamında kurulmuştur.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class MisyonVizyonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Misyon ve Vizyon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _showDialog(context, 'Vizyon',
                    'Vizyon: Adı gibi iz bırakan öncü bir üniversite olmak.');
              },
              child: const Text('Vizyon'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showDialog(context, 'Misyon',
                    'Misyon: Eğitime kattığı farklılıklarla nitelikli bireyler yetiştiren, ulusal ve uluslararası düzeyde özgün bilgi üreten, toplumsal sorunların çözümüne katkı sağlayan yenilikçi ve lider bir üniversite olmaktır.');
              },
              child: const Text('Misyon'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Değerler:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Öğrenci Odaklılık\n'
                  'Kalite Kültürü\n'
                  'Eleştirel Düşünme\n'
                  'Yaşam Boyu Öğrenme\n'
                  'Etik Yaklaşım\n'
                  'Farklılıklara Saygı',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}

class AmacPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amaç'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Biruni Üniversitesi Olarak Amacımız',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kurumun misyon, vizyon ve değerlerine bağlı kalarak;\n\n'
                  'Sağlık alanında (disiplinler arası branşlar dahil) yüksek kalite ve özgünlüğün sağlanacağı tematik bir üniversite olmak,\n'
                  'Ülkemizin sağlık sorunları üzerine araştırmalar gerçekleştirecek, katma değer oluşturabilecek, yüksek kaliteli araştırmacılar ve akademisyenler yetiştirmek,\n'
                  '2023 vizyonuna hizmet edecek şekilde, sağlık alanında AR-GE’ye ağırlık verip ülkenin ihtiyaçları çerçevesinde üretime katkı sağlamaktır.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class KurucuVakifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurucu Vakıf'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kurucu Vakıf',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dünya Eğitim Vakfı, Dünya Bilim Tarihi’nin en önemli bilim adamlarından biri olan ve UNESCO tarafından 1974 yılında Evrensel Deha ilan edilen Ebu Reyhan El-Biruni ’den ilham alarak Biruni Üniversitesi’ni kurmuştur.\n\n'
                  'Dünya Eğitim Vakfı, İstanbul\'da özellikle eğitim, sağlık, kültür alanında topluma verimli ve etkin düzeyde hizmet sunmak, toplumun gelişmesine katkıda bulunmak amacıyla faaliyet yürütmektedir.\n\n'
                  'Dünya Eğitim Vakfı Misyonu;\n\n'
                  'Kadim vakıf geleneğine bağlı olarak, insanlığın yararına bilgi üretecek eğitim kurumlarına ve sağlık kurumlarına destek olmaktır.\n\n'
                  'Dünya Eğitim Vakfı Vizyonu;\n\n'
                  'Milli değerler ışığında medeniyetimizi ileriye taşıyacak, her düzeyde, evrensel bilgi ve teknolojiyle donatılmış, etik değerlere saygılı, nitelikli, araştırmacı bireylerin yetişmesini sağlamaktır.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class RektorMesajiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rektörün Mesajı'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Geleceğin bilim insanlarına…',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'İsmini dünya bilim tarihinde “Evrensel Deha” olarak anılan, 11. Yüzyıla adını veren bilim insanı Ebu Reyhan El Biruni’ den alan Üniversitemizde; Tıp Fakültesi, Diş Hekimliği Fakültesi, Eczacılık Fakültesi, Sağlık Bilimleri Fakültesi, Eğitim Fakültesi, Mühendislik ve Doğa Bilimleri Fakültesi olmak üzere 6 Fakülte, Lisansüstü Eğitim Enstitüsü ve Meslek Yüksek Okulu ile hizmet verilmektedir.\n\n'
                  '“Bilimin Geleceği” ilkesiyle eğitimine devam eden, öğrencileri ve çalışanları için mutluluk, hoşgörü ve başarı merkezi olmayı amaçlayan ve hizmetlerinde mükemmelliği hedefleyen üniversitemiz; öğrenmeye ve topluma değer katan, yenilikçi uygulamaları ve başarıları ile yurt içi ve yurt dışında örnek alınan, adı gibi iz bırakan öncü bir üniversite olma yolundadır. Üniversitemiz, insanlığın ihtiyacı olan bilgiyi üreten, eleştirel düşünebilen kişisel ve mesleki alanda kendini sürekli yenileyen, etik değerlere sahip, ulusal ve evrensel sorunlara duyarlı, toplumun değer yargılarına ve farklılıklarına saygılı, problemlere çözüm üretebilecek yetkinlikte bireyler yetiştirmeyi misyon edinmiştir.\n\n'
                  'Türkiye ve dünyanın yarını, bugünün gençliğinin hangi ölçüde “kaliteli” bir eğitim alacağı ile belirlenecektir. Eğitimde yeniliklerin, farklılıkların ve kalitenin simgesi olma yolunda olan Üniversitemizde eğitim-öğretimi yeni nesile uygun hale getirmek amacıyla “Biruni Derse Hazırlık Metodu”, “Bir Bilgin Ol” yöntemi uygulanmaktadır.\n\n'
                  'Sevgili gençler, ülkemizde sağlık meslekleri ile ilgili tüm bölümlerin mevcut olduğu Üniversitemizde eğitim almak için birçok sebebiniz bulunmaktadır. Öncelikle sizlere İstanbul’un merkezi Topkapı semtinde, tarihi surların karşısında yer alan geniş sosyal imkanları mevcut kampüs alanı ile güvenli ve nitelikli öğrencilik hayatı sunmaktayız. Büyük bir heyecan ve güçlü bir akademik kadroyla insanlık ve ülkemiz adına verilen bu hizmetin aktörleri olmanın gururunu, azmini ve heyecanını, verdiğimiz nitelikli mezunlarımız ile yaşamaktayız..\n\n'
                  'Sizleri, geleceğin bilim insanları ve donanımlı meslek üyesi olarak yetiştirecek, konusunda uzman öğretim kadrosuyla, ileri teknolojiye sahip hastane ve laboratuvarıyla buluşturan öncü bir üniversitede bilimin geleceğini yazmaya eğitim almaya davet ediyorum.\n\n'
                  'Biruni’nin bilime olan tutkusu ve çalışma azminin bizlere verdiği enerji ve heyecan ile sizleri bilimin geleceğini yazmak üzere Biruni ailesine bekliyorum.\n\n'
                  'Sevgi ve Saygılarımla…\n\n'
                  'Rektör\n\n'
                  'Prof. Dr. Adnan YÜKSEL',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class StratejikPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stratejik Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _launchURL();
              },
              child: const Text('Stratejik Planı Görüntüle'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://www.biruni.edu.tr/doc/stratejik-plan-guncel.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Bu URL açılamaz: $url';
    }
  }
}

class KalitePlaniPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalite Planı'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Biruni Üniversitesi Kalite Politikası:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kurumumuzun misyon, vizyon ve değerlerine bağlı kalarak;\n\n'
                  '• 21.Yüzyıl yetkinliklerine sahip insanı yetiştirmek amacıyla bilim ve teknolojideki değişim ve gelişmeleri eğitim öğretim aşamalarında uygulayarak Üniversiteyi öncü ve lider bir konuma taşımak.\n'
                  '• Bireysel yetenekleri keşfetmek için programlar hazırlamak, paydaşlarına göre fark oluşturacak evrensel bir bakış açısı kazandırmak.\n'
                  '• Uluslararasılaşma için başta dil ve son teknolojiyi kullanmak üzere, zamanın gereksinimleri ile donatılmış nitelikte öğrenciler yetiştirmek.\n'
                  '• Öğrenci odaklı yaklaşımı ile hizmet ve faaliyetleri sürekli iyileştirerek memnuniyet oranını yükseltmek.\n'
                  '• Çalışanlar ve diğer paydaşların memnuniyetini göz önünde bulundurmak.\n'
                  '• Ulusal ve uluslararası bilimsel araştırmalar ile “Bilimin Geleceği” olmak.\n'
                  '• Araştırma-Geliştirme faaliyetlerini destekleyerek “Bilim İnsanı” yetiştirmek.\n'
                  '• Öğrencilere geleceğe okumayı öğretmek, güncel ve geleceğe yönelik projeler yapmaya hazırlamak ve yaptırmak.\n'
                  '• Akademik ve idari tüm süreçlerde etkililiği, etkinliği ve verimliliği ön plana alarak sürekli iyileştirmeyle sürdürülebilirliği sağlamak.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            const Text(
              'Biruni Üniversitesi Eğitim – Öğretim Politikası:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kurumumuzun misyon, vizyon ve değerlerine bağlı kalarak;\n\n'
                  '• Eğitim öğretim de uygulamaya ağırlık veren dünya standartlarında bir düzeye ulaşmak.\n'
                  '• Uygulanan ve uygulanacak olan yöntemlerle öğrencinin aktif bir öğrenim süreci geçirmesini hedeflemek.\n'
                  '• Akademisyenlerin öğrencilere öncülük etmelerine ve çok disiplinli çalışma uygulamalarıyla öğrencinin çok yönlü yetişmesine olanak sağlamak.\n'
                  '• Öğrencinin ihtiyaçlarını, değerlerini ve tercihlerini de dikkate alarak etkin ve etkili bir eğitim-öğretim sağlamak.\n'
                  '• Akademisyenlerin gelişimine katkı sağlamak.\n'
                  '• Eğitim öğretim programlarını paydaşlarla işbirliği yaparak güncellemek.\n'
                  '• Bilgi ve iletişim teknolojilerinin sağladığı etkileşimli ve çoklu ortam yoluyla bilgiye daha hızlı ve kolay ulaşabilme olanaklarıyla, öğretimde sürdürülebilirliği, yaygınlığı, çeşitliliği, telafi edilebilirliği sağlamak.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            const Text(
              'Biruni Üniversitesi Araştırma – Geliştirme Politikası:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kurumun misyon, vizyon ve değerlerine bağlı kalarak;\n\n'
                  '• Nitelikli ve güncel, araştırmaların yapılmasına imkân sağlamak.\n'
                  '• Çok disiplinli araştırma yapılmasını özendirmek ve desteklemek.\n'
                  '• Projelerden bilimsel yayın ve fikr-i mülkiyet hakkı üretimini desteklemek.\n'
                  '• Fikir- proje- patent / bilimsel yayın – girişimcilik – ticarileşme ekosistemini kurmak ve sürdürebilirliğini sağlamak.\n'
                  '• Üniversiteyi araştırma – geliştirmede daha üst sıralara taşıyarak cazibe merkezi haline getirmek.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

// Additional Pages for navigation
class KampusHakkindaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kampüs Hakkında'),
      ),
      body: const Center(
        child: Text('Kampüs Hakkında İçeriği'),
      ),
    );
  }
}

class Sanal extends StatelessWidget {
  const Sanal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SanalTur(),
    );
  }
}
