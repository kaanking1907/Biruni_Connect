import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnketPage extends StatefulWidget {
  const AnketPage({super.key});

  @override
  _AnketPageState createState() => _AnketPageState();
}

class _AnketPageState extends State<AnketPage> {
  final SupabaseClient _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> anketler = [];

  @override
  void initState() {
    super.initState();
    _loadAnketler().then((value) {
      setState(() {
        anketler = value;
      });
    });
  }

  // Supabase'den anket verilerini yükle
  Future<List<Map<String, dynamic>>> _loadAnketler() async {
  final response = await _supabase.from('anketler').select();

  if (response == null || response.isEmpty) {
    throw Exception('Veriler yüklenemedi veya tablo boş.');
  }

  final data = response as List<dynamic>;

  print("Yüklenen Anketler: $data"); // Burada veriyi konsola yazdırıyoruz

  return data.map((e) {
    return {
      'id': e['id'],  // Bu alandaki id doğru geliyor mu?
      'soru': e['soru'],
      'secenekler': [e['secenek1'], e['secenek2']],
      'oylar': [e['oy1'], e['oy2']],
      'aciklamalar': [e['aciklama1'], e['aciklama2']],
    };
  }).toList();
}


  // Supabase'de oy verilerini artır
  Future<void> arttirOy(String anketId, int secenekIndex) async {
  try {
    final response = await _supabase.rpc('increment_oy', params: {
      'anket_id': 1,
      'secenek_index': 0
    });

    if (response == null) {
      throw Exception('Oy güncellenemedi.');
    }

    print('Oy başarıyla güncellendi!');
  } catch (error) {
    print('OY VERME HATASI: $error');
  }
}




  // Oy verme işlemi
  Future<void> oyVer(int anketId, int secenekIndex) async {
  try {
    print(">>> Oy verme başlatıldı");
    print("Anket ID: $anketId, Seçenek index: $secenekIndex");

    final response = await Supabase.instance.client
        .rpc('increment_oy', params: {
          'anket_id': anketId,
          'secenek_index': secenekIndex,
        });

    print("OY VERME BAŞARILI ✅");

    // Oy verme başarılı olduğunda teşekkür mesajı göster
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Oy kullandığınız için teşekkürler!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  } catch (error) {
    print("OY VERME HATASI ❌: $error");

    // Hata durumunda kırmızı bir mesaj göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hata: $error'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}



  // Toplam oy sayısını hesapla
  int toplamOySayisi(int anketIndex) {
    final List<int> oylar = anketler[anketIndex]['oylar'];
    return oylar.reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anketler'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _loadAnketler(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Henüz anket bulunmamaktadır.'));
          } else {
            final anketler = snapshot.data!;
            return ListView.builder(
              itemCount: anketler.length,
              itemBuilder: (context, anketIndex) {
                final anket = anketler[anketIndex];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Anket sorusu
                        Text(
                          anket['soru'],
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),

                        // Anket seçenekleri
                        ...List.generate(anket['secenekler'].length, (secenekIndex) {
                          final secenek = anket['secenekler'][secenekIndex];
                          final oySayisi = anket['oylar'][secenekIndex];
                          return ListTile(
                            title: Text(secenek),
                            trailing: Text('$oySayisi oy'),
                            tileColor: Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onTap: () {
                              oyVer(anket['id'], secenekIndex); // Oy verme işlemini tetikle
                            },
                          );
                        }),

                        const SizedBox(height: 10.0),

                        const SizedBox(height: 10.0),

                        // Açıklamalar başlığı
                        const Text(
                          'Açıklamalar:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),

                        // Açıklamaları listeleme
                        ...List.generate(anket['aciklamalar'].length, (index) {
                          final aciklama = anket['aciklamalar'][index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              '- $aciklama',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}