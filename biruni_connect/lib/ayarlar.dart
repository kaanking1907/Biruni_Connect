import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'language_provider.dart';
//import 'theme_provider.dart';

class AyarlarPage extends StatefulWidget {
  @override
  _AyarlarPageState createState() => _AyarlarPageState();
}

class _AyarlarPageState extends State<AyarlarPage> {
  bool _isDarkTheme = false; // Geçici tema değişkeni
  bool _notificationsEnabled = true; // Bildirim durumu
  String _selectedLanguage = 'Türkçe'; // Varsayılan dil

  @override
  Widget build(BuildContext context) {
    //final languageProvider = Provider.of<LanguageProvider>(context);
    //final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Dil Seçin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              //value: languageProvider.currentLanguage,
              value: _selectedLanguage,
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
                  _selectedLanguage = newValue!;
                  //languageProvider.currentLanguage = newValue;
                });
              },
              items: <String>['Türkçe', 'English', 'Arabic']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text(
              'Seçilen Dil: $_selectedLanguage',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'Tema Ayarları:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Karanlık Tema'),
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                  //themeProvider.toggleTheme();
                });
              },
              secondary: const Icon(Icons.dark_mode),
            ),
            const Divider(),
            const Text(
              'Bildirimler:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Bildirimleri Aç'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              secondary: const Icon(Icons.notifications),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ayarlar Kaydedildi'),
                  ),
                );
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
