import 'package:flutter/material.dart';
import 'package:biruni_connect/ham_menu.dart';
import 'package:url_launcher/url_launcher.dart'; // URL açma işlemi için

class OdemeSecenekleriPage extends StatelessWidget {
  // URL açma fonksiyonu
  Future<void> _openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL açılamadı: $url';
    }
  }

  // Fotoğraf widget'ı oluşturma fonksiyonu
  Widget buildFacultySection({
    required String title,
    required String imagePath,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            // İndirme URL'si (gerekirse düzenlenebilir)
            _openURL('https://example.com/$imagePath');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Seçenekleri'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // Sağ taraftaki menüyü aç
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: const HamburgerMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Ödeme Seçenekleri Butonu
            ElevatedButton(
              onPressed: () {
                _openURL('https://aday.biruni.edu.tr/odeme_secenekleri.html');
              },
              child: Text('Ödeme Seçenekleri'),
            ),

            SizedBox(height: 20),

            // Fakülte Bölümleri
            buildFacultySection(
              title: 'Eğitim Fakültesi',
              imagePath: 'assets/images/odeme_egitim.png',
            ),
            buildFacultySection(
              title: 'Mühendislik ve Doğa Bilimleri Fakültesi',
              imagePath: 'assets/images/odeme_muh.png',
            ),
            buildFacultySection(
              title: 'Sağlık Bilimleri Fakültesi',
              imagePath: 'assets/images/odeme_saglık.png',
            ),
            buildFacultySection(
              title: 'Tıp Fakültesi',
              imagePath: 'assets/images/odeme_tip.png',
            ),
            buildFacultySection(
              title: 'Diş Hekimliği Fakültesi',
              imagePath: 'assets/images/odeme_dis.png',
            ),
            buildFacultySection(
              title: 'Eczacılık Fakültesi',
              imagePath: 'assets/images/odeme_ecza.png',
            ),
          ],
        ),
      ),
    );
  }
}
