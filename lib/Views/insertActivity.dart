import 'package:flutter/material.dart';

class InsertDailyActivity extends StatefulWidget {
  const InsertDailyActivity({super.key});

  @override
  State<InsertDailyActivity> createState() => _InsertActivDailyityState();
}

class _InsertActivDailyityState extends State<InsertDailyActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Activity'),
      ),
      body: Center(
        // Your implementaion
        // ...
        child: ElevatedButton(
          child: const Text('Go back to Home Page!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}