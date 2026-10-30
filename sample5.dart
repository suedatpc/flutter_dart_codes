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
      home: const BmiPage(),
    );
  }
}

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController heightController =
      TextEditingController();

  final TextEditingController weightController =
      TextEditingController();

  String selectedGender = 'Erkek';

  String result = '';

  void calculateBmi() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final double height =
        double.parse(heightController.text) / 100;

    final double weight =
        double.parse(weightController.text);

    final double bmi = weight / (height * height);

    String category;

    if (bmi < 18.5) {
      category = 'Zayıf';
    } else if (bmi < 25) {
      category = 'Normal';
    } else if (bmi < 30) {
      category = 'Fazla kilolu';
    } else {
      category = 'Obezite';
    }

    setState(() {
      result =
          'Cinsiyet: $selectedGender\n'
          'BMI: ${bmi.toStringAsFixed(1)}\n'
          'Durum: $category';
    });
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Hesaplama'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Boy (cm)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Boy bilgisini giriniz.';
                  }

                  final height = double.tryParse(value);

                  if (height == null) {
                    return 'Lütfen sayısal bir değer giriniz.';
                  }

                  if (height < 50 || height > 250) {
                    return 'Boy 50-250 cm arasında olmalıdır.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Kilo (kg)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kilo bilgisini giriniz.';
                  }

                  final weight = double.tryParse(value);

                  if (weight == null) {
                    return 'Lütfen sayısal bir değer giriniz.';
                  }

                  if (weight < 20 || weight > 300) {
                    return 'Kilo 20-300 kg arasında olmalıdır.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Cinsiyet',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Erkek',
                    child: Text('Erkek'),
                  ),
                  DropdownMenuItem(
                    value: 'Kadın',
                    child: Text('Kadın'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: calculateBmi,
                  child: const Text('Hesapla'),
                ),
              ),

              const SizedBox(height: 24),

              if (result.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}