import 'package:flutter/material.dart';

class ActivityListView extends StatelessWidget {
  final activityicon;
  final passTap;
  final String activityName;
  final String activityDetail;
  final String activityOnTap;
  // final int numberOfActivityName;

  const ActivityListView({
    Key? key,
    required this.activityicon,
    required this.activityName,
    required this.activityDetail,
    required this.activityOnTap,
    this.passTap,
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
        child: GestureDetector(
          onTap: passTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.grey[200],
                        child: Icon(
                          activityicon,
                          color: Colors.orange[800],
                          size: 40,
                        )),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activityName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        // numberOfActivityName.toString() + 'PersonalCare Data from hospital',
                        activityDetail,
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
              // Icon(Icons.more_horiz),
            ],
          ),
        ),
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
