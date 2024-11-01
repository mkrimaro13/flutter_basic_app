import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app/src/feature/widgets/app_drawer.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate;
  int? _age;
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
        _age = _calculateAge(pickedDate);
      });
    });
  }

  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Age Calculator')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text(_selectedDate == null
                  ? 'Select your birthday'
                  : 'Change your birthday: ${_selectedDate!.toIso8601String().substring(0, 10)}')),
          SizedBox(height: 20),
          if (_age != null)
            Text('You are $_age years old', style: TextStyle(fontSize: 18)),
                        ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Go to Homescreen'),
          ),
          SizedBox(height: 20),
        ],
      )),
    );
  }
}
