import 'package:flutter/material.dart';
import 'sikca_sorulan_page.dart'; // Sıkça Sorulan Sorular sayfası
import 'odeme_secenekleri_page.dart'; // Öğrenim Ücretleri ve Ödeme Seçenekleri sayfası
import 'puanlar_siralamalar_page.dart'; // Puanlar ve Sıralamalar sayfası
import 'yurtlar_page.dart'; // Kız ve Erkek Biruni Yurtları sayfası
import 'demo_dersler_page.dart'; // Demo Dersler sayfası
import 'bolum_program_tanitimi_page.dart'; // Bölüm Program Tanıtımı sayfası
import 'uluslararasi_gelecegine_dokun_page.dart'; // Uluslararası Geleceğine Dokun sayfası
import 'cagdas_page.dart';// Çağdaş ve Yenilikçi Eğitim Programları sayfası
import 'package:biruni_connect/ham_menu.dart';

class AdayOgrenciPage extends StatelessWidget {
  const AdayOgrenciPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aday Öğrenci'),
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
        backgroundColor: Colors.blue,
      ),
      endDrawer: const HamburgerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 görsel aynı satırda
            crossAxisSpacing: 16.0, // Görseller arasındaki yatay boşluk
            mainAxisSpacing: 16.0, // Görseller arasındaki dikey boşluk
            childAspectRatio: 1, // Kare şeklinde olacaklar
          ),
          itemCount: 8, // 8 görsel var (sonunda 1 yeni görsel ekledik)
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return _buildClickableImage(
                  context,
                  'assets/images/sikca_soru.png',
                  const SikcaSorulanPage(), // Sıkça Sorulan Sorular sayfasına yönlendir
                );
              case 1:
                return _buildClickableImage(
                  context,
                  'assets/images/odeme.png',
                  OdemeSecenekleriPage(), // Öğrenim Ücretleri ve Ödeme Seçenekleri sayfasına yönlendir
                );
              case 2:
                return _buildClickableImage(
                  context,
                  'assets/images/puanlar_siralamalar.png',
                  PuanlarVeSiralamalarPage(), // Puanlar ve Sıralamalar sayfasına yönlendir
                );
              case 3:
                return _buildClickableImage(
                  context,
                  'assets/images/yurtlar.png',
                  const YurtlarPage(), // Kız ve Erkek Biruni Yurtları sayfasına yönlendir
                );
              case 4:
                return _buildClickableImage(
                  context,
                  'assets/images/demo_dersler.png', // Demo Dersler sayfasına yönlendiren görsel
                  const DemoDerslerPage(), // Demo Dersler sayfasına yönlendir
                );
              case 5:
                return _buildClickableImage(
                  context,
                  'assets/images/bolum_program_tanitimi.png', // Bölüm Program Tanıtımı görseli
                  const BolumProgramTanitimPage(), // Bölüm Program Tanıtımı sayfasına yönlendir
                );
              case 6:
                return _buildClickableImage(
                  context,
                  'assets/images/uluslararasi_gelecegine_dokun.png', // Uluslararası Geleceğine Dokun görseli
                  UluslararasiGelecegineDokunPage(), // Uluslararası Geleceğine Dokun sayfasına yönlendir
                );
              case 7:
                return _buildClickableImage(
                  context,
                  'assets/images/cagdas_egitim.png', // Çağdaş ve Yenilikçi Eğitim Programları görseli
                  const CagdasVeYenilikciEgitimPage(), // Çağdaş ve Yenilikçi Eğitim Programları sayfasına yönlendir
                );
              default:
                return const SizedBox
                    .shrink(); // Default olarak boş bir widget döner
            }
          },
        ),
      ),
    );
  }

  // Tıklanabilir görsel widget'ı
  Widget _buildClickableImage(
      BuildContext context, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200, // Opsiyonel arka plan rengi
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Gölge pozisyonu
            ),
          ],
        ),
        child: Image.asset(
          imagePath, // Görselin yolu
          height: 200.0, // Kare boyut için genişlik ve yükseklik aynı
          width: 200.0,
          fit: BoxFit.cover, // Görselin kareye uygun kesimi
        ),
      ),
    );
  }
}