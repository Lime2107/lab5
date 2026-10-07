import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Categories',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const RecipeHomePage(),
    );
  }
}

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  // Practice making widgets from smaller widgets by writing makeRow()
  Widget makeRow(
      List images,
      List labels,
      bool isOverlay,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(images.length, (index) {
        if (isOverlay) {
          // Text OVERLAYING the image using Stack
          return Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(images[index]),
              ),
              Text(
                labels[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          // Text BELOW the image using Column
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(images[index]),
              ),
              const SizedBox(height: 8.0),
              Text(
                labels[index],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          // Meets Demonstration Criteria: Root is a Column() using SpaceBetween
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Item 1: Main Title
              const Text(
                "BROWSE CATEGORIES",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              // Item 2: Subtitle
              const Text(
                "Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),

              // Item 3: Meat Header
              const Text(
                "BY MEAT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              // Item 4: Meat Row
              makeRow(
                const [
                  "assets/images/beef.jpg",
                  "assets/images/chicken.jpg",
                  "assets/images/pork.jpg",
                  "assets/images/seafood.jpg",
                ],
                const ["BEEF", "CHICKEN", "PORK", "SEAFOOD"],
                true, // Overlay is true
              ),

              // Item 5: Course Header
              const Text(
                "BY COURSE",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              // Item 6: Course Row
              makeRow(
                const [
                  "assets/images/main_dishes.jpg",
                  "assets/images/salad.jpg",
                  "assets/images/side_dishes.jpg",
                  "assets/images/crockpot.jpg",
                ],
                const [
                  "Main Dishes",
                  "Salad Recipes",
                  "Side Dishes",
                  "Crockpot",
                ],
                false, // Overlay is false
              ),

              // Item 7: Dessert Header
              const Text(
                "BY DESSERT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              // Item 8: Dessert Row
              makeRow(
                const [
                  "assets/images/ice_cream.jpg",
                  "assets/images/brownies.jpg",
                  "assets/images/pies.jpg",
                  "assets/images/cookies.jpg",
                ],
                const ["Ice Cream", "Brownies", "Pies", "Cookies"],
                false, // Overlay is false
              ),
            ],
          ),
        ),
      ),
    );
  }
}