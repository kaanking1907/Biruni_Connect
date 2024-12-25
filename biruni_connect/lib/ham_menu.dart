import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ayarlar.dart';
import 'SanalTur/sanal_tur.dart';
import 'InfoButtons/akademik_takvim_page.dart';
import 'kampus_rebher.dart';
import 'InfoButtons/about_page.dart';
import 'main.dart';

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  String _selectedCategory = 'Kampüs Hakkında';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
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
                ListTile(
                  title: const Text('Ana Sayfa', style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Akademik Programlar',
                      style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AkademikTakvimPage()),
                    );
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      const Text('Kategori', style: TextStyle(fontSize: 16.0)),
                      Spacer(),
                      DropdownButton<String>(
                        value: _selectedCategory,
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
                    Navigator.pop(context);
                    const url = 'https://sis.biruni.edu.tr';
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
                    Navigator.pop(context);
                    const url = 'https://malikayit.biruni.edu.tr';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'URL açılamadı: $url';
                    }
                  },
                ),
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
                      MaterialPageRoute(
                          builder: (context) => IletisimDestekPage()),
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
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo2.png', // Dosya yolunuza göre güncelleyin
              height: 100.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
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
