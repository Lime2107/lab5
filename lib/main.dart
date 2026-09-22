import 'package:flutter/material.dart';

// DELETED: Removed default Flutter tutorial comments

/// The main entry point of the application. // ADDED
void main() {
  runApp(const MyApp());
}

/// Root widget of the application. // ADDED
/// It is a StatelessWidget because the app settings do not change. // ADDED
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Builds the MaterialApp layout structure. // ADDED
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1', // MODIFIED
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const _MyStudentInfo(), // MODIFIED: Set home to _MyStudentInfo
    );
  }
}

// ADDED: Private widget displaying student info
/// Private widget displaying student info.
/// It is a StatelessWidget because the displayed text remains static at runtime.
class _MyStudentInfo extends StatelessWidget {
  const _MyStudentInfo();

  /// Builds the layout containing the top purple bar and student text vertically.
  @override
  Widget build(BuildContext context) {
    // ADDED: Variable to control font size dynamically
    double myFontSize = 30.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My name is: Bui Dang Lam (041199250)',
              style: TextStyle(fontSize: myFontSize), // ADDED: TextStyle using myFontSize
            ),
            Text(
              'The course is CST2335',
              style: TextStyle(fontSize: myFontSize), // ADDED: TextStyle using myFontSize
            ),
            Text(
              'Lab Assignment 1',
              style: TextStyle(fontSize: myFontSize), // ADDED: TextStyle using myFontSize
            ),
          ],
        ),
      ),
    );
  }
}