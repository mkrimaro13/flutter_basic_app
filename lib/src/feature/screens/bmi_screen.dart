import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app/src/feature/widgets/app_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double? _bmi;
  String? _category;

  void _calculateBMI() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;
    if (weight > 0 && height > 0) {
      final double heightInMeters = height / 100;
      setState(() {
        _bmi = weight / (heightInMeters * heightInMeters);
        _category = _determineCategory(_bmi!);
      });
    }
  }

  String _determineCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Weight in Kilograms',
                  border: OutlineInputBorder(),
                  hintText: "Enter your weight in Kilograms"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Height in centimeters',
                  border: OutlineInputBorder(),
                  hintText: "Enter your height in centimeters"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _calculateBMI, child: Text('Calculate your BMI')),
            SizedBox(height: 20),
            if (_bmi != null)
              Text(
                  'Your BMI is ${_bmi!.toStringAsFixed(2)} and your category is $_category',
                  style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go to Homescreen'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
