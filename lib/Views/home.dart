// ignore_for_file: prefer_const_constructors

import 'package:x_personalcare/Views/health-insert.dart';
import 'package:x_personalcare/util/emoticon_face.dart';
import 'package:x_personalcare/util/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:x_personalcare/Controllers/user.dart';
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

  Future<bool> _onBackPressed(BuildContext context) async {
    // You can add any additional logic before exiting the app
    // For example, show a confirmation dialog
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App?'),
            content: Text('Do you want to exit the application?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; // If the user dismisses the dialog, default to false
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        return _onBackPressed(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(240, 239, 243, 247),
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
                      colorBg: Colors.orange[300],
                      icon: Icons.favorite,
                      SmartWatchActivityName: 'Walk',
                      SmartWatchActivityDetail: 'Dasd',
                    ),
                    SmartWatchListView(
                      color: Colors.green[500],
                      colorBg: Colors.red[200],
                      icon: Icons.favorite,
                      SmartWatchActivityName: 'Heart Rate',
                      SmartWatchActivityDetail: 'Dasd',
                    ),
                    SmartWatchListView(
                      color: Colors.orange[300],
                      colorBg: Colors.blue[700],
                      icon: Icons.favorite,
                      SmartWatchActivityName: 'Drink water',
                      SmartWatchActivityDetail: 'Dasd',
                    ),
                    SmartWatchListView(
                      color: Colors.pink[300],
                      colorBg: Colors.green[700],
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                  // children: const [
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        // Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(
                          Icons.health_and_safety_rounded,
                          weight: 200,
                          color: Colors.blue,
                        ),
                        Text(
                          'Health Care Function',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    // before version is old ROW (127-138)
                    SizedBox(
                      height: 10,
                    ),
                    // newMethod(context, "Insert Healt Data",
                    //     "This testing one widget . . ."),
                    // _buildWidgetHome(
                    //     context, 'Insert activity', 'Widget_GET_Subtitle', () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => InsertActivityPage()),
                    //   );
                    // }),
                    ActivityListView(
                      activityicon: Icons.monitor_heart_sharp,
                      activityName: 'Health Analytic',
                      activityDetail: 'PersonalCare Data from hospital',
                      activityOnTap: "healthInsert()",
                      passTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => healthInsert()),
                        );
                      },
                    ),
                    ActivityListView(
                      activityicon: Icons.format_align_justify_rounded,
                      activityName: 'Result Analytic',
                      activityDetail: 'information of your health ',
                      activityOnTap: "",
                    ),
                    ActivityListView(
                      activityicon: Icons.privacy_tip_rounded,
                      activityName: 'About Health',
                      activityDetail: 'update with dailynews ',
                      activityOnTap: "",
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      // ====================== This old Version ===============================
      // child: ListTile(
      //   title: Text(itemName),
      //   subtitle: Text(GET_Subtitle),
      //   onTap: onTap,
      //   leading: CircleAvatar(child: Text("IN")),
      // ),

      // =======================================================================

      //======================= This New Version ===============================

      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.orange,
                      child: Icon(
                        Icons.favorite,
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
                      itemName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      // numberOfActivityName.toString() + 'PersonalCare Data from hospital',
                      GET_Subtitle,
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
          ],
        ),
      ),

      // ==================================================================================================
      // ==================================================================================================
    );
  }
}
