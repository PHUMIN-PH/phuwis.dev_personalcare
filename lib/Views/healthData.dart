import 'package:flutter/material.dart';

class HealthData extends StatefulWidget {
  const HealthData({super.key});

  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data For You'),
        automaticallyImplyLeading: false, // Hide the back button
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
