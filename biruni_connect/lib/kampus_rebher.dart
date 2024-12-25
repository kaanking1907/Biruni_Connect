import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'main.dart';
import 'ham_menu.dart';
import 'dart:math' show atan2, pi, sin, cos;

void main() {
  runApp(KampusRehberi());
}

class KampusRehberi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _locationMessage = "Konum alınamadı";
  List<String> _distancesAndDirections = [];
  bool _isLoading = false;

  // Hedef konumlar (Enlem, Boylam)
  final List<Map<String, dynamic>> targetLocations = [
    {'name': 'Öğrenci İşleri', 'latitude': 41.017921339141864, 'longitude': 28.916280538059222},
    {'name': 'Yemekhane', 'latitude': 41.01791635793286, 'longitude': 28.916399914689308},
    {'name': 'BirStore', 'latitude': 41.01786593705821, 'longitude': 28.916327025056873},
  ];

  // Konumu almak için bir fonksiyon
  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    // Kullanıcıdan izin iste
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Konum izni verilmedi";
        _isLoading = false;
      });
      return;
    }

    // Konum bilgisini al
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _locationMessage = 'Enlem: ${position.latitude}, Boylam: ${position.longitude}';
      _calculateDistancesAndDirections(position);
      _isLoading = false;
    });
  }

  // Hedef konumlarla mesafe ve yön hesaplayan fonksiyon
  void _calculateDistancesAndDirections(Position userPosition) {
    List<String> distancesAndDirections = [];
    for (var target in targetLocations) {
      double distance = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        target['latitude'],
        target['longitude'],
      );

      // Azimut açısını hesapla
      double deltaLongitude = target['longitude'] - userPosition.longitude;
      double y = sin(deltaLongitude * pi / 180) *
          cos(target['latitude'] * pi / 180);
      double x = cos(userPosition.latitude * pi / 180) *
          sin(target['latitude'] * pi / 180) -
          sin(userPosition.latitude * pi / 180) *
              cos(target['latitude'] * pi / 180) *
              cos(deltaLongitude * pi / 180);
      double bearing = atan2(y, x) * 180 / pi;

      // Açıyı 0-360 arasına normalize et
      bearing = (bearing + 360) % 360;

      // Kullanıcının doğrudan bakış açısına göre sağ/sol belirle
      String direction = bearing > 180 ? "Solunda" : "Sağında";

      // Mesafe ve yön bilgilerini ekle
      distancesAndDirections.add(
          '${target['name']}: ${(distance / 1000).toStringAsFixed(2)} km, $direction');
    }

    setState(() {
      _distancesAndDirections = distancesAndDirections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kampüs Rehberi"),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false, // Tüm geçmişi temizler
            );
          },
        ),
      ),
      endDrawer: const HamburgerMenu(),
      body: Center( // Ana widget'ı Center ile sarıyoruz
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // İçerikleri dikeyde ortala
            crossAxisAlignment: CrossAxisAlignment.center, // İçerikleri yatayda ortala
            children: [
              // Şu anki koordinatlarınız başlığı
              Text(
                "Şu anki koordinatlarınız",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              // Konum alınamadı yazısı
              Text(
                _locationMessage,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Konumu güncelle butonu
              ElevatedButton(
                onPressed: _getCurrentLocation,
                child: Text("Konumu Güncelle"),
              ),
              SizedBox(height: 20),

              // Yükleniyor durumu
              if (_isLoading)
                CircularProgressIndicator(),

              // "Bu işlem birkaç saniye sürebilir" mesajı
              SizedBox(height: 10),
              Text(
                "Bu işlem birkaç saniye sürebilir",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              // Mesafeler ve yön bilgisi
              if (_distancesAndDirections.isNotEmpty)
                ..._distancesAndDirections.map((info) => Text(
                  info,
                  style: TextStyle(fontSize: 18),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
