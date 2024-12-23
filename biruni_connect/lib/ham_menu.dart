import 'package:biruni_connect/main.dart';
import 'package:flutter/material.dart';
import 'ayarlar.dart';
import 'SanalTur/sanal_tur.dart';

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
            title: const Text('Akademik Programlar', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context); // Menüyü kapat
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AkademikProgramlarPage()),
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
                          MaterialPageRoute(builder: (context) => KampusHakkindaPage()),
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
                          MaterialPageRoute(builder: (context) => KampusRehberiPage()),
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
          // Başvuru ve Kayıt Butonu
          ListTile(
            title: const Text('Başvuru ve Kayıt', style: TextStyle(fontSize: 16.0)),
            onTap: () {
              Navigator.pop(context); // Menüyü kapat
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasvuruKayitPage()),
              );
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

// Ana Sayfa Sayfası
class AnaSayfaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
      ),
      body: const Center(
        child: Text('Ana Sayfa İçeriği'),
      ),
    );
  }
}

// Akademik Programlar Sayfası
class AkademikProgramlarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akademik Programlar'),
      ),
      body: const Center(
        child: Text('Akademik Programlar İçeriği'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İletişim ve Destek'),
      ),
      body: const Center(
        child: Text('İletişim ve Destek İçeriği'),
      ),
    );
  }
}

// Sayfa 6: Hakkımızda
class HakkimizdaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
      ),
      body: const Center(
        child: Text('Hakkımızda İçeriği'),
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

class KampusRehberiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kampüs Rehberi'),
      ),
      body: const Center(
        child: Text('Kampüs Rehberi İçeriği'),
      ),
    );
  }
}
