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
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'iPhone 15',
      'price': '45.000 ₺',
      'icon': Icons.phone_iphone,
    },
    {
      'name': 'MacBook Air',
      'price': '52.000 ₺',
      'icon': Icons.laptop_mac,
    },
    {
      'name': 'AirPods',
      'price': '7.000 ₺',
      'icon': Icons.headphones,
    },
    {
      'name': 'iPad',
      'price': '25.000 ₺',
      'icon': Icons.tablet,
    },
    {
      'name': 'Apple Watch',
      'price': '15.000 ₺',
      'icon': Icons.watch,
    },
    {
      'name': 'Klavye',
      'price': '2.000 ₺',
      'icon': Icons.keyboard,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Kataloğu'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                product['icon'],
                size: 40,
              ),
              title: Text(
                product['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(product['price']),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {
                print('${product['name']} seçildi');
              },
            ),
          );
        },
      ),
    );
  }
}