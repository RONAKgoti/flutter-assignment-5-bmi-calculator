import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const BmiCalculatorPage(),
    );
  }
}

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double height = 170;
  double weight = 70;

  double get bmi {
    return weight / ((height / 100) * (height / 100));
  }

  String getBmiCategory() {
    if (bmi < 18.5) {
      return 'Underweight 😟';
    } else if (bmi < 24.9) {
      return 'Normal 😊';
    } else if (bmi < 29.9) {
      return 'Overweight 😐';
    } else {
      return 'Obese 😣';
    }
  }

  Color getCategoryColor() {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 24.9) {
      return Colors.green;
    } else if (bmi < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  void resetValues() {
    setState(() {
      height = 170;
      weight = 70;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color resultColor = getCategoryColor();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF4F7),
      appBar: AppBar(
        title: const Text('Interactive BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${height.toStringAsFixed(0)} cm',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Slider(
                    min: 100,
                    max: 220,
                    value: height,
                    activeColor: Colors.pink,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Weight',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${weight.toStringAsFixed(0)} kg',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Slider(
                    min: 20,
                    max: 150,
                    value: weight,
                    activeColor: Colors.pink,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: resultColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: resultColor, width: 2),
              ),
              child: Column(
                children: [
                  const Text(
                    'Your BMI',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: resultColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    getBmiCategory(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: resultColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: resetValues,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Reset',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
