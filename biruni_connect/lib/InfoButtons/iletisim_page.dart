import 'package:flutter/material.dart';
import 'package:biruni_connect/ham_menu.dart';

class IletisimDestekPage extends StatefulWidget {
  @override
  _IletisimDestekPageState createState() => _IletisimDestekPageState();
}

class _IletisimDestekPageState extends State<IletisimDestekPage> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  // Hazır sorular ve cevaplar
  final Map<String, String> faq = {
    'Kampüs nerede?': 'Biruni Üniversitesi, Zeytinburnu/İstanbul\'da yer almaktadır.',
    'Telefon numaranız nedir?': '444 8 276 (BRN) numarasıyla bizlere ulaşabilirsiniz.',
    'E-posta adresiniz nedir?': 'E-posta: info@biruni.edu.tr veya biruniuniv@hs01.kep.tr.',
    'Sanal tur nasıl yapılır?': 'Sanal tur için Kampüs Hakkında menüsünden "Sanal Tur" seçeneğini kullanabilirsiniz.',
    'Akademik takvim nerede?': 'Akademik takvimi, Akademik Programlar menüsünden bulabilirsiniz.',
  };

  // Kullanıcının seçtiği hazır soruyu göndermek
  void _sendFAQ(String question) {
    setState(() {
      messages.add({'type': 'user', 'text': question});
      messages.add({'type': 'bot', 'text': faq[question]!});
    });
  }

  // Kullanıcının yazdığı mesajı göndermek
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({'type': 'user', 'text': _controller.text});
        messages.add({'type': 'bot', 'text': 'Sorunuzu aldık! En kısa sürede yanıt vereceğiz.'});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İletişim ve Destek'),
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
            const SizedBox(height: 16.0),
            // Hazır sorular listesi
            const Text(
              '💬 Chatbot',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // Hazır soruları içeren butonlar
            Wrap(
              spacing: 10.0,
              children: faq.keys.map((question) {
                return ElevatedButton(
                  onPressed: () => _sendFAQ(question),
                  child: Text(question),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return Align(
                          alignment: message['type'] == 'user'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: message['type'] == 'user'
                                  ? Colors.blue[200]
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              message['text']!,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            labelText: 'Mesajınızı yazın...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        onPressed: _sendMessage,
                        icon: const Icon(Icons.send, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
