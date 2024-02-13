import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truck_driver_app/login_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
              // Add your notification toggle logic here
            },
          ),
          SwitchListTile(
            title: Text('Enable Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
              // Add your dark mode toggle logic here
            },
          ),
          ListTile(
            title: Text('Account Details'),
            leading: Icon(Icons.person),
            onTap: () {
              // Navigate to account details page
            },
          ),
          ListTile(
            title: Text('Driving Preferences'),
            leading: Icon(Icons.drive_eta),
            onTap: () {
              // Navigate to driving preferences page
            },
          ),
          ListTile(
            title: Text('Accessibility'),
            leading: Icon(Icons.accessibility),
            onTap: () {
              // Navigate to accessibility settings page
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
