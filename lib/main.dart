import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // Controllers to read the text fields
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable initialized to the question mark image (using images_lab2 and .jpg)
  var imageSource = "images_lab2/question-mark.jpg";

  // Variable to track the current language (English by default)
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  // Function to load saved credentials when the app starts
  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLogin = prefs.getString('loginName');
    String? savedPassword = prefs.getString('password');

    // If we have saved data, put it in the text fields and show a Snackbar
    if (savedLogin != null && savedPassword != null) {
      setState(() {
        _loginController.text = savedLogin;
        _passwordController.text = savedPassword;
      });

      // Show the Snackbar after the UI builds
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEnglish
                ? "Previous login name and password loaded."
                : "Nom d'utilisateur et mot de passe précédents chargés."),
            duration: const Duration(seconds: 3),
          ),
        );
      });
    }
  }

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
                controller: _loginController,
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
                  String password = _passwordController.text;

                  setState(() {
                    // Check if string is "ASDF"
                    if (password == "ASDF") {
                      imageSource = "images_lab2/light-bulb.jpg";
                    } else {
                      imageSource = "images_lab2/stop-sign.jpg";
                    }
                  });

                  // Show the AlertDialog asking to save credentials
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: Text(isEnglish ? "Save Login?" : "Enregistrer la connexion?"),
                        content: Text(isEnglish
                            ? "Would you like to save your username and password for the next time?"
                            : "Voulez-vous enregistrer votre nom d'utilisateur et votre mot de passe pour la prochaine fois?"),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              // Clear SharedPreferences data
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.remove('loginName');
                              await prefs.remove('password');

                              if (context.mounted) {
                                Navigator.of(dialogContext).pop();
                              }
                            },
                            child: Text(isEnglish ? "No" : "Non"),
                          ),
                          TextButton(
                            onPressed: () async {
                              // Save to SharedPreferences
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setString('loginName', _loginController.text);
                              await prefs.setString('password', _passwordController.text);

                              if (context.mounted) {
                                Navigator.of(dialogContext).pop();
                              }
                            },
                            child: Text(isEnglish ? "Yes" : "Oui"),
                          ),
                        ],
                      );
                    },
                  );
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

              // Language Switch Button
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
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}