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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mağaza'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kategoriler',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categoryItem('Elektronik'),
                    _categoryItem('Giyim'),
                    _categoryItem('Kitap'),
                    _categoryItem('Ev'),
                    _categoryItem('Spor'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Ürünler',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _productCard(
                      'Telefon',
                      '15.000 ₺',
                      Icons.phone_android,
                    ),
                    _productCard(
                      'Laptop',
                      '35.000 ₺',
                      Icons.laptop,
                    ),
                    _productCard(
                      'Kulaklık',
                      '2.000 ₺',
                      Icons.headphones,
                    ),
                    _productCard(
                      'Tablet',
                      '12.000 ₺',
                      Icons.tablet,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _categoryItem(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget _productCard(
    String name,
    String price,
    IconData icon,
  ) {
    return SizedBox(
      width: 160,
      height: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
              ),
              const SizedBox(height: 12),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(price),
            ],
          ),
        ),
      ),
    );
  }
}