import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:truck_driver_app/setting_page.dart';
import 'dashboard_page.dart';
import 'edit_profile_widget.dart';
import 'help_support_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'recent.dart'; // Make sure to import recent.dart here
import 'setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Replace with your Firebase options
  );
  runApp(MyApp());
}

Future<void> requestPermissions() async {
  await [Permission.location, Permission.sms, Permission.phone].request();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truckive Driver App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.yellowAccent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/dashboard': (context) => DashboardPage(),
        '/editProfile': (context) => EditProfileWidget(),
        '/helpSupport': (context) => HelpSupportPage(),
        '/recent': (context) => RecentServicesWidget(), // Add this line
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
