import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ayarlar.dart';
import 'InfoButtons/akademik_takvim_page.dart';
import 'kampus_rebher.dart';
import 'InfoButtons/about_page.dart';
import 'main.dart';
import 'InfoButtons/iletisim_page.dart';
import 'AnketPage.dart';

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
                    '1üni Connect',
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
                      const Text('', style: TextStyle(fontSize: 16.0)),
                      //Spacer(),
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
                  title: const Text('Anketler'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnketPage()));
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
              'assets/1uni/1uni_bilimin.png', // Dosya yolunuza göre güncelleyin
              height: 100.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
