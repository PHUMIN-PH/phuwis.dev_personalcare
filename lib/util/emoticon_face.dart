import 'package:flutter/material.dart';

class SmartWatchListView2 extends StatelessWidget {
  final String emoticonFace;

  const SmartWatchListView2({
    Key? key,
    required this.emoticonFace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Center(
        child: Icon(
          Icons.person_2_rounded,
          color: Colors.pink,
          size: 36.0,
        ),
      ),
    );
  }
}
