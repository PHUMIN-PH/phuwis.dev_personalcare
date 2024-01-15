// ignore_for_file: prefer_const_constructors

import 'package:ener_personalcare/Views/health-insert.dart';
import 'package:ener_personalcare/util/emoticon_face.dart';
import 'package:ener_personalcare/util/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:ener_personalcare/Controllers/user.dart';
import 'widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future logout() async {
    await User.setsignin(false);
    var logdata = User.setsignin(false);
    print("object is : ");
    print(logdata);
    Navigator.pushNamed(context, 'login');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: [
                  //Greeting row
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello  DevPH',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'sunshine morning',
                            style: TextStyle(color: Colors.blue[100]),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Container clicked For Sign=out");
                          logout();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(right: 20),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SmartWatchListView(
                    color: Colors.blue,
                    icon: Icons.favorite,
                    SmartWatchActivityName: 'Walk',
                    SmartWatchActivityDetail: 'Dasd',
                  ),
                  SmartWatchListView(
                    color: Colors.green[500],
                    icon: Icons.favorite,
                    SmartWatchActivityName: 'Heart Rate',
                    SmartWatchActivityDetail: 'Dasd',
                  ),
                  SmartWatchListView(
                    color: Colors.orange[300],
                    icon: Icons.favorite,
                    SmartWatchActivityName: 'Drink water',
                    SmartWatchActivityDetail: 'Dasd',
                  ),
                  SmartWatchListView(
                    color: Colors.pink[300],
                    icon: Icons.favorite,
                    SmartWatchActivityName: 'Drink water',
                    SmartWatchActivityDetail: 'Dasd',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Main Activity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                // children: const [
                children: [
                  // before version is old ROW (127-138)
                  SizedBox(
                    height: 10,
                  ),
                  newMethod(context, "Test one widget",
                      "This testing one widget . . ."),
                  _buildWidgetHome(
                      context, 'Widget Item2', 'Widget_GET_Subtitle', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => healthInsert()),
                    );
                  }),
                  ActivityListView(
                    activityicon: Icons.favorite,
                    activityName: 'Insert Health Data',
                    activityDetail: 'PersonalCare Data from hospital',
                    activityOnTap: "healthInsert()",
                  ),
                  ActivityListView(
                    activityicon: Icons.calendar_month,
                    activityName: 'Activity Daily',
                    activityDetail: 'insert daily activity ',
                    activityOnTap: "",
                  ),
                  ActivityListView(
                    activityicon: Icons.food_bank,
                    activityName: 'Favorite Food',
                    activityDetail: 'insert daily food in application',
                    activityOnTap: "",
                  ),
                  ActivityListView(
                    activityicon: Icons.favorite,
                    activityName: 'Insert other',
                    activityDetail: 'PersonalCare',
                    activityOnTap: "",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget newMethod(BuildContext context, String itemName, String subtitle) {
    return _buildWidgetHome(
      context,
      itemName,
      subtitle,
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => healthInsert()),
        );
      },
    );
  }

  Widget _buildWidgetHome(BuildContext context, String itemName,
      String GET_Subtitle, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(itemName),
        subtitle: Text(GET_Subtitle),
        onTap: onTap,
        leading: CircleAvatar(child: Text("IN")),
      ),
    );
  }
}
