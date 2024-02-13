import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatelessWidget {
  // Helper method to launch URLs.
  void _launchURL(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.deepPurple, // Customize your color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduce your FAQ section
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('How to start a new delivery?'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigate or show details for this FAQ
              },
            ),
            ListTile(
              title: Text('What to do if my vehicle breaks down?'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigate or show details for this FAQ
              },
            ),
            ListTile(
              title: Text('How to report an issue with my delivery?'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigate or show details for this FAQ
              },
            ),
            // More FAQs can be added here...
            Divider(),
            // Section for more direct help options
            Text(
              'Need more help?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email Support'),
              subtitle: Text('support@truckive.com'), // Customize your email
              onTap: () {
                _launchURL('mailto:support@truckive.com'); // Launches email app
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Call Us'),
              subtitle: Text('+1 234 567 890'), // Customize your phone number
              onTap: () {
                _launchURL('tel:+1 234 567 890'); // Launches phone dialer
              },
            ),
          ],
        ),
      ),
    );
  }
}
