import 'package:flutter/material.dart';

void main() {
  runApp(healthInsert());
}

class healthInsert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(),
    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildSettingsItem(context, 'Setting menu Item 1', () {
          // Action to perform when Item 1 is tapped
          _onItem1Tapped(context);

        }),
        _buildSettingsItem(context, 'Setting menu Item 2', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        // Add more items as needed
        _buildSettingsItem(context, 'Setting menu Item 3', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 4', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 5', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 6', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 7', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 8', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 9', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 10', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 11', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 12', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 13', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 14', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 15', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 16', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 17', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
        _buildSettingsItem(context, 'Setting menu Item 18', () {
          // Action to perform when Item 2 is tapped
          _onItem2Tapped(context);
        }),
      ],
    );
  }

  Widget _buildSettingsItem(BuildContext context, String itemName, VoidCallback onTap) {
    return Card(
      child: ListTile(
        title: Text(itemName),
        onTap: onTap,
        leading:CircleAvatar(child: Text('A')),
      ),
    );
  }

  void _onItem1Tapped(BuildContext context) {
    // Replace this with the action you want to perform for Item 1
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item 1 Tapped!'),
      ),
    );
  }

  void _onItem2Tapped(BuildContext context) {
    // Replace this with the action you want to perform for Item 2
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item 2 Tapped!'),
      ),
    );
  }
}
