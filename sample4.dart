import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool autoUpdateEnabled = true;
  bool termsAccepted = false;

  String selectedLanguage = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Bildirimler'),
                  subtitle: const Text(
                    'Uygulama bildirimlerini aç veya kapat.',
                  ),
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('Koyu Mod'),
                  subtitle: const Text(
                    'Koyu görünümü etkinleştir.',
                  ),
                  value: darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      darkModeEnabled = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('Otomatik Güncelleme'),
                  value: autoUpdateEnabled,
                  onChanged: (value) {
                    setState(() {
                      autoUpdateEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dil Seçimi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  RadioListTile<String>(
                    title: const Text('Türkçe'),
                    value: 'Türkçe',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    title: const Text('English'),
                    value: 'English',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: CheckboxListTile(
              title: const Text('Kullanım koşullarını kabul ediyorum'),
              value: termsAccepted,
              onChanged: (value) {
                setState(() {
                  termsAccepted = value ?? false;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: termsAccepted
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ayarlar kaydedildi.'),
                      ),
                    );
                  }
                : null,
            child: const Text('Ayarları Kaydet'),
          ),

          TextButton(
            onPressed: () {
              setState(() {
                notificationsEnabled = true;
                darkModeEnabled = false;
                autoUpdateEnabled = true;
                termsAccepted = false;
                selectedLanguage = 'Türkçe';
              });
            },
            child: const Text('Varsayılanlara Dön'),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Ayarlar Uygulaması',
                  );
                },
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Yardım butonuna basıldı.');
        },
        child: const Icon(Icons.help),
      ),
    );
  }
}