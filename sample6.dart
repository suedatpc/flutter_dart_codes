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
      title: 'Navigasyon Örneği',
      home: const MainPage(),
    );
  }
}

// --------------------------------------------------
// ANA SAYFA
// --------------------------------------------------

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedIndex == 0
              ? 'Ana Sayfa'
              : selectedIndex == 1
                  ? 'Profil'
                  : 'Ayarlar',
        ),
      ),

      drawer: const AppDrawer(),

      body: pages[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// ANA SAYFA İÇERİĞİ
// --------------------------------------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPage(),
            ),
          );
        },
        child: const Text('Detay Sayfasına Git'),
      ),
    );
  }
}

// --------------------------------------------------
// PROFİL SAYFASI
// --------------------------------------------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: 'Profil',
              ),
              Tab(
                icon: Icon(Icons.info),
                text: 'Bilgiler',
              ),
            ],
          ),

          const Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text(
                    'Profil Bilgileri',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Text(
                    'Kullanıcı Hakkında',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// AYARLAR SAYFASI
// --------------------------------------------------

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPage(),
            ),
          );
        },
        child: const Text('Ayar Detaylarına Git'),
      ),
    );
  }
}

// --------------------------------------------------
// DETAY SAYFASI
// --------------------------------------------------

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detay'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Geri Dön'),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// DRAWER
// --------------------------------------------------

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'Menü',
              style: TextStyle(fontSize: 24),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Ana Sayfa'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Hakkında'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// HAKKINDA
// --------------------------------------------------

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkında'),
      ),
      body: const Center(
        child: Text(
          'Navigasyon uygulaması',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}