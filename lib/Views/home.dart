// ignore_for_file: prefer_const_constructors

import 'package:ener_personalcare/util/emoticon_face.dart';
import 'package:ener_personalcare/util/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:ener_personalcare/Controllers/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future logout() async {
    await User.setsignin(false);
    Navigator.pushNamed(context, 'login');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                            'Hello  Admin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '215 data vm machine',
                            style: TextStyle(color: Colors.blue[100]),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Search BAr ---------------------------------------------------
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // how do you feel?

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'How do you feel today?',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 22,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Icon(
                  //       Icons.more_horiz,
                  //       color: Colors.white,
                  //     ),
                  //   ],
                  // ),

                  SizedBox(
                    height: 20,
                  ),

                  // 4 difference Icons --------------------------------------

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         SmartWatchListView(
                  //           emoticonFace: 's',
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         SmartWatchListView(
                  //           emoticonFace: 's',
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         SmartWatchListView(
                  //           emoticonFace: 's',
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         SmartWatchListView(
                  //           emoticonFace: 's',
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  // End of icon list ----------------------------------------
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
                    color: Colors.orange[300],
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
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[100],
                child: Center(
                    child: Column(
                  children: [
                    // Excercise Heading . . . . . . . .  . . .

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Main Activity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.more_horiz),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // ListView of excercise . . . . . . . . . . . . . . ..
                    Expanded(
                      child: ListView(
                        children: [
                          ActivityListView(
                            icon: Icons.favorite,
                            ActivityName: 'Insert Health Data',
                            ActivityDetail: 'PersonalCare Data from hospital',
                          ),
                          ActivityListView(
                            icon: Icons.calendar_month,
                            ActivityName: 'Activity Daily',
                            ActivityDetail: 'insert daily activity ',
                          ),
                          ActivityListView(
                            icon: Icons.food_bank,
                            ActivityName: 'Favorite Food',
                            ActivityDetail: 'insert daily food in application',
                          ),
                          ActivityListView(
                            icon: Icons.favorite,
                            ActivityName: 'Insert other',
                            ActivityDetail: 'PersonalCare',
                          ),
                          ActivityListView(
                            icon: Icons.favorite,
                            ActivityName: 'Insert other',
                            ActivityDetail: 'PersonalCare',
                          ),
                          ActivityListView(
                            icon: Icons.favorite,
                            ActivityName: 'Insert other',
                            ActivityDetail: 'PersonalCare',
                          ),
                          ActivityListView(
                            icon: Icons.favorite,
                            ActivityName: 'Insert other',
                            ActivityDetail: 'PersonalCare',
                          ),
                          ActivityListView(
                            icon: Icons.favorite,
                            ActivityName: 'Insert other',
                            ActivityDetail: 'PersonalCare',
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
