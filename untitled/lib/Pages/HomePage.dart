import 'package:flutter/material.dart';

import '../Ui/colors.dart';
import '../Ui/constants.dart';
import '../main.dart';
import '../widget/figure_image.dart';
import 'CategorySelectionPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondryColorDark, // Darker secondary color for contrast
      body: Stack(
        children: [
          // Background decoration with a gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.primaryColorDark1,
                  AppColor.secondryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Foreground content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Game title with animations
                  Column(
                    children: [
                      Text(
                        "Hangman",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 3,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black38,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Guess the word or meet the hangman!",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.teaGreen,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // Center image (animated or static)
                  figureImage(true, "assets/intro.gif"),

                  // Interactive buttons
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeApp(
                                words: defaultCat, // Pass the animalWords list directly
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColorDark1,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Start Game",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategorySelectionPage(
                                onCategorySelected: (String) {},
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColorDark1,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Choose Category",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Footer section with About Us
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showAboutDialog(context);
                        },
                        child: Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Ensure better contrast
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Created by Linah M. Elnaghi",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.teaGreen,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to show the About dialog
  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.primaryColorDark1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "About Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.teaGreen,
            ),
          ),
          content: Text(
            "This game was created by Linah M. Elnaghi. "
                "It's a simple yet fun Hangman game designed to challenge your vocabulary skills. "
                "Enjoy playing and have fun!",
            style: TextStyle(
              fontSize: 16,
              color: AppColor.teaGreen,
            ),
            textAlign: TextAlign.justify,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Close",
                style: TextStyle(
                  color: AppColor.teaGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}