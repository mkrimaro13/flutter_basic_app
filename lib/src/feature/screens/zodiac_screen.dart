import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app/src/feature/widgets/app_drawer.dart';

class ZodiacScreen extends StatefulWidget {
  const ZodiacScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ZodiacScreenState createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  String? _zodiacSign;
  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _zodiacSign = _determineZodiacSign(pickedDate);
      });
    });
  }

  String _determineZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capicorn";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return "Pisces";
    } else {
      return "Date is not recognized ＼（〇_ｏ）／";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Zodiac Sign Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'What is your name?',
                hintText: 'Your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _presentDatePicker,
                child: Text(_selectedDate == null
                    ? 'Select your birthday'
                    : 'Change your birthday: ${_selectedDate!.toIso8601String().substring(0, 10)}')),
            SizedBox(height: 20),
            if (_zodiacSign != null)
              Text(
                  'Hello ${_nameController.text}, Your zodiac sign is → $_zodiacSign',
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
