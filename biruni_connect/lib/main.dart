import 'package:flutter/material.dart';
import 'loading_logo.dart';
import 'InfoButtons/erasmus_page.dart';
import 'InfoButtons/tanitimfilmi_page.dart';
import 'InfoButtons/aday_ogrenci_page.dart';
import 'ham_menu.dart';
import 'InfoButtons/akademik_takvim_page.dart';
import 'InfoButtons/surdurulebilirlik_page.dart';
import 'InfoButtons/surekli_egitim_page.dart';
import 'InfoButtons/kariyer_merkezi_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BiruniConnectApp());

  await Supabase.initialize(
    url: 'url',
    anonKey: 'anonkey',
  );
}

class BiruniConnectApp extends StatelessWidget {
  const BiruniConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'biruni Connect',
        home: LoadingScreen()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(''),
        automaticallyImplyLeading: false,
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
      endDrawer: const HamburgerMenu(), // Add the HamburgerMenu here
      body: DefaultTabController(
        length: 3, // Duyurular, Etkinlikler, Haberler için 3 sekme
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst kısım logo görseli
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset(
                  'assets/1uni/1uni_bilimin.png', // Logonun yolu
                  height: 100.0,
                ),
              ),
            ),
            // TabBar (Duyurular, Etkinlikler, Haberler)
            const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'Haberler'),
                Tab(text: 'Duyurular'),
                Tab(text: 'Etkinlikler'),
              ],
            ),
            // TabBarView
            Container(
              height: 200.0,
              child: TabBarView(
                children: [
                  _buildScrollableContent([
                    {
                      'text': 'Duyuru 1: Bahar dönemi kayıtları başladı!',
                      'image': 'assets/1uni/25-26_Ogrenci_basvuru.png',
                    },
                    {
                      'text': 'Duyuru 2: Yeni etkinlikler takvimi yayınlandı!',
                      'image': 'assets/1uni/Tıp_akre_basari_toren.png',
                    },
                    {
                      'text': 'Duyuru 3: Mezuniyet töreni detayları açıklandı!',
                      'image': 'assets/images/dyr3.png',
                    },
                    {
                      'text': 'Duyuru 3: Büyükelçi okulumuzu ziyaret etti.',
                      'image': 'assets/images/dyr4.png',
                    },
                    {
                      'text': 'Duyuru 3: Rusya sağlık devi Birunide',
                      'image': 'assets/images/dyr5.png',
                    },
                  ]),
                  _buildScrollableContent([
                    {
                      'text': 'Etkinlik 1: Kariyer Günü',
                      'image': 'assets/images/etkin.png',
                    },
                    {
                      'text': 'Etkinlik 2: Erasmus Bilgilendirme Semineri',
                      'image': 'assets/images/etkin2.png',
                    },
                    {
                      'text': 'Etkinlik 3: Spor Turnuvaları',
                      'image': 'assets/images/etkin3.png',
                    },
                    {
                      'text': 'Etkinlik 3: Spor Turnuvaları',
                      'image': 'assets/images/etkin4.png',
                    },
                  ]),
                  _buildScrollableContent([
                    {
                      'text': 'Haber 1: Yeni akademik bina açıldı!',
                      'image': 'assets/images/haber.png',
                    },
                    {
                      'text': 'Haber 2: Araştırma projelerine ödüller verildi.',
                      'image': 'assets/images/haber2.png',
                    },
                    {
                      'text':
                      'Haber 3: Üniversitemiz dünya sıralamasında yükseldi.',
                      'image': 'assets/images/haber3.png',
                    },
                  ]),
                ],
              ),
            ),
            // Alt kısım bölmeler
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8.0),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  _buildGridItem(
                    context,
                    'Tanıtım Filmi',
                    const Color.fromARGB(255, 108, 184, 247),
                    'assets/images/tanitim.png',
                    'https://www.youtube.com/watch?v=T7Csn6DGqSU',
                    onTap: launchYouTubeVideo,
                  ),
                  _buildGridItem(
                    context,
                    'Aday Öğrenci',
                    const Color.fromARGB(255, 233, 163, 58),
                    'assets/images/adayögrenci.png',
                    '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdayOgrenciPage(),
                        ),
                      );
                    },
                  ),
                  _buildGridItem(
                    context,
                    'Akademik Takvim',
                    const Color.fromARGB(255, 68, 148, 233),
                    'assets/images/akademiktakvim.png',
                    '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AkademikTakvimPage(),
                        ),
                      );
                    },
                  ),
                  _buildGridItem(
                    context,
                    'Sürekli Eğitim Uygulama Araştırma Merkezi',
                    const Color.fromARGB(255, 108, 184, 247),
                    'assets/images/merkezi.png',
                    '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurekliEgitimPage(),
                        ),
                      );
                    },
                  ),
                  _buildGridItem(
                    context,
                    'Kariyer Merkezi',
                    Color.fromARGB(255, 233, 163, 58),
                    'assets/images/kariyer.png',
                    '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KariyerMerkeziPage(),
                        ),
                      );
                    },
                  ),
                  _buildGridItem(
                    context,
                    'Uluslararası',
                    Color.fromARGB(255, 68, 148, 233),
                    'assets/images/uluslararasi.png',
                    '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ErasmusPage(),
                        ),
                      );
                    },
                  ),
                  _buildGridItem(
                    context,
                    'Sürdürülebilirlik',
                    const Color.fromARGB(255, 108, 184, 247),
                    'assets/images/sürdürülebilirlik.png',
                    '',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurdurulebilirlikPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, Color color,
      String imagePath, String url,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Butona özel onTap davranışı
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 103.0,
              width: 160.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableContent(List<Map<String, String>> items) {
    return Column(
      children: [
        const SizedBox(height: 25.0),
        SizedBox(
          height: 170.0,
          child: PageView(
            children:
            items.map((item) => _buildAnnouncementItem(item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementItem(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.blue.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item['image']!,
            height: 150.0,
            width: 450.0,
          ),
        ],
      ),
    );
  }
}