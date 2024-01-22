import 'package:flutter/material.dart';

class HeealthData extends StatefulWidget {
  const HeealthData({super.key});

  @override
  State<HeealthData> createState() => _HeealthDataState();
}

class _HeealthDataState extends State<HeealthData> {
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
