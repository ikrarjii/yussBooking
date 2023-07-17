import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kioser_booking/daftar_booking.dart';

import 'services/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: const InputDecoration(hintText: "Username"),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: "Password"),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: LoginApp,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> LoginApp() async {
    final name = username.text;
    final pswd = password.text;

    final body = {
      "username": name,
      "password": pswd,
    };
    const url = "https://yusroom.be.sman17gowa.com/api/login";
    final uri = Uri.parse(url);

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successful login
      navigateToAddPage();
      final responseData = jsonDecode(response.body);
      String token = responseData['data']['access_token'];
      Auth.setAccessToken(token);
      
    } else if (response.statusCode == 401) {
      // Invalid credentials
      showErrorMessage('Invalid username or password');
    } else {
      // Other error
      showErrorMessage('Login Failed');
    }
  }

  void showSuccesMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context) => HomePage());
    await Navigator.push(context, route);
  }
}
