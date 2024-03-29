import 'package:flutter/material.dart';

class ActivityListView extends StatelessWidget {
  final icon;
  final String ActivityName;
  final String ActivityDetail;
  // final int numberOfActivityName;

  const ActivityListView({
    Key? key,
    required this.icon,
    required this.ActivityName,
    required this.ActivityDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.orange,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ActivityName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    // numberOfActivityName.toString() + 'PersonalCare Data from hospital',
                    ActivityDetail,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.more_horiz),
        ]),
      ),
    );
  }
}

class SmartWatchListView extends StatelessWidget {
  final color;
  final icon;
  final SmartWatchActivityName;
  final SmartWatchActivityDetail;

  const SmartWatchListView({
    Key? key,
    required this.color,
    required this.icon,
    required this.SmartWatchActivityName,
    required this.SmartWatchActivityDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    padding: EdgeInsets.all(16),
                    color: color,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 20,
                width: 120,
              ),
              Text(
                SmartWatchActivityName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                // numberOfActivityName.toString() + 'PersonalCare Data from hospital',
                SmartWatchActivityDetail,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
