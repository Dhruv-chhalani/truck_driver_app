import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:truck_driver_app/dashboard_page.dart';
import 'register_page.dart'; // Ensure this import is correct based on your project structure

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Future<void> _showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Successful'),
            content: Text('You have been logged in Successfully'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushNamed(context, 'dashboard');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    Future<void> _showErrorDialog(String errorMessage) async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    Future<bool> getUser(email, password) async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          await _showErrorDialog('No user found for that email.');
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          await _showErrorDialog('Wrong password provided for that user.');
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        await _showErrorDialog("Login Failed");
      }

      if (FirebaseAuth.instance.currentUser != null) {
        return true;
      } else {
        return false;
      }
    }

    Future<void> login() async {
      final email = emailController.text;
      final password = passwordController.text;

      final userCreated = await getUser(email, password);
      if (userCreated) {
        await _showSuccessDialog();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
      } else {
        print('Error');
        _showErrorDialog("error");
      }
      //dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            FlutterLogo(size: 100), // Consider using your own logo
            SizedBox(height: 40),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Button color
                onPrimary: Colors.white, // Text color
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () async {
                await login();
              },
              child: Text('Log In'),
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage())),
              child: Text('Don’t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
