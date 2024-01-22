import 'package:ener_personalcare/Views/health-insert.dart';
import 'package:flutter/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ener_personalcare/util/main_activity.dart';
import 'package:ener_personalcare/Controllers/user.dart';
import 'package:ener_personalcare/Views/settings/accessibility.dart';

class SettingBtn extends StatefulWidget {
  const SettingBtn({super.key});

  @override
  State<SettingBtn> createState() => _SettingBtnState();
}

class _SettingBtnState extends State<SettingBtn> {
  @override
  Future logout() async {
    await User.setsignin(false);
    Navigator.pushNamed(context, 'login');
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: FadeIn(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: ListView(
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(top: 50.0),
                  //     ),
                  //     Text(
                  //       "SETTING",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 25,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  _topUserInfo(width: width),
                  SizedBox(
                    height: 20,
                  ),
                  FadeIn(
                    child: Container(
                      width: width,
                      // color: Colors.pink[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "setting menu",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('Accessibility'),
                              subtitle: Text('Supporting text'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('Bluetooth & Devices'),
                              subtitle: Text('Supporting text'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('Languages'),
                              subtitle: Text('Supporting text'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('Notification'),
                              subtitle: Text('Supporting text'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('Security & Privacy'),
                              subtitle: Text('Supporting text'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Text(
                              "Other",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {
                                logout();
                              },
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('Logout'),
                              subtitle: Text('logout'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(child: Text('A')),
                              title: Text('temp'),
                              subtitle: Text('Supporting text'),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          // _widgetSetting('Text Widget Setting TEST','this is subTextWidgetSetting',(){}),
                          _buildSettingsItem(
                              context, 'Setting menu Item 18', 'testing', () {
                            // Action to perform when Item 2 is tapped
                          }),
                          _buildWidgetSetting(
                            context,
                            'Widget Item2',
                            'Widget_GET_Subtitle',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => healthInsert()),
                              );
                            },
                          )
                          // Card(
                          //   child: InkWell(
                          //     splashColor: Colors.blue,
                          //     child: ListTile(
                          //       leading: CircleAvatar(child: Text('A')),
                          //       title: Text('Sign-out'),
                          //       subtitle: Text('Supporting text'),
                          //       trailing: Icon(Icons.exit_to_app_outlined),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, String itemName,
      String GET_Subtitle, VoidCallback onTap) {
    return Card(
      child: ListTile(
        title: Text(itemName),
        subtitle: Text(GET_Subtitle),
        onTap: onTap,
        leading: CircleAvatar(child: Text('A')),
      ),
    );
  }

  Widget _buildWidgetSetting(BuildContext context, String itemName,
      String GET_Subtitle, VoidCallback onTap) {
    return Card(
      child: ListTile(
        title: Text(itemName),
        subtitle: Text(GET_Subtitle),
        onTap: onTap,
        leading: CircleAvatar(child: Text('A')),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}

class _widgetSetting extends StatelessWidget {
  final String textWidgetSetting;
  final String subTextWidgetSetting;
  final Function onTapWidgetSetting;

  const _widgetSetting({
    super.key,
    required this.textWidgetSetting,
    required this.subTextWidgetSetting,
    required this.onTapWidgetSetting,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTapWidgetSetting,
        leading: CircleAvatar(child: Text('A')),
        title: Text(textWidgetSetting),
        subtitle: Text(subTextWidgetSetting),
        trailing: Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}

class _topUserInfo extends StatelessWidget {
  const _topUserInfo({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?size=626&ext=jpg&ga=GA1.1.235733382.1695105677&semt=sph"),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Developer Zone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            Text(
              "Developer Zone",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: width * 0.03,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
          ],
        ),
      ],
    );
  }
}
