import 'package:flutter/material.dart';

// The entry point that starts the Flutter application
void main() {
  runApp(const MyApp());
}

// The root widget of your application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Lab2LoginPage(),
    );
  }
}

// Your Stateful Login Page
class Lab2LoginPage extends StatefulWidget {
  const Lab2LoginPage({super.key});

  @override
  State<Lab2LoginPage> createState() => _Lab2LoginPageState();
}

class _Lab2LoginPageState extends State<Lab2LoginPage> {
  // Controller to read the password string
  final TextEditingController _passwordController = TextEditingController();

  // Variable initialized to the question mark image (using images_lab2 and .jpg)
  var imageSource = "images_lab2/question-mark.jpg";

  // Variable to track the current language (English by default)
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? 'Lab 2 Login' : 'Labo 2 Connexion'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Login Name Field
              TextField(
                decoration: InputDecoration(
                  labelText: isEnglish ? "Login name" : "Nom d'utilisateur",
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password Field with obscureText: true
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: isEnglish ? "Password" : "Mot de passe",
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Read the string typed in the password field
                  String password = _passwordController.text;

                  setState(() {
                    // Check if string is "ASDF"
                    if (password == "ASDF") {
                      imageSource = "images_lab2/light-bulb.jpg";
                    } else {
                      imageSource = "images_lab2/stop-sign.jpg";
                    }
                  });
                },
                child: Text(isEnglish ? "Login" : "Connexion"),
              ),
              const SizedBox(height: 30),

              // Image display with 300x300 size
              Image.asset(
                imageSource,
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 30),

              // Language Switch Button (Moved below the image)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEnglish = !isEnglish;
                  });
                },
                child: Text(isEnglish ? "Switch to French" : "Passer à l'anglais"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}