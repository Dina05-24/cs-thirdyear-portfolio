import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LeapYearChecker()));
}

class LeapYearChecker extends StatefulWidget {
  const LeapYearChecker({super.key});

  @override
  State<LeapYearChecker> createState() => _LeapYearCheckerState();
}

class _LeapYearCheckerState extends State<LeapYearChecker> {
  // هذا المتحكم هو المسؤول عن قراءة ما تكتبه في المربع
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void checkLeapYear() {
    int? year = int.tryParse(_controller.text);
    if (year == null) {
      setState(() => _result = "Please enter a valid number");
      return;
    }

    // نفس المنطق البرمجي الذي كتبته أنت
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      setState(() => _result = "$year is a Leap Year! ✅");
    } else {
      setState(() => _result = "$year is not a Leap Year ❌");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leap Year Checker")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Enter a year"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkLeapYear,
              child: const Text("Check"),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}