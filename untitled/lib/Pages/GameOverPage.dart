import 'package:flutter/material.dart';

import '../Ui/colors.dart';
import 'HomePage.dart';

class GameOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondryColor,
      body: Stack(
        children: [
          // Full-screen GIF hanging from the top
          Positioned(
            top: -450,
            left: 0,
            right: -350,
            child: Image.asset(
              'assets/hangrope.gif',
              fit: BoxFit.cover,
              height: 1000, // Large height for visibility
              width: double.infinity, // Full width
            ),
          ),

          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Game Over text with bubble animation effect
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColor.secondryColorDark1,
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 30,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          "GAME OVER",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.redAccent,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Looks like the end... Have another go?",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColorDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Buttons with fun icon additions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColorDark,
                      minimumSize: Size(140, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    icon: Icon(Icons.refresh, color: Colors.white),
                    label: Text(
                      "Start Over",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      minimumSize: Size(140, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    icon: Icon(Icons.replay, color: Colors.white),
                    label: Text(
                      "Try Again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Fun Footer Message
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Hint: Maybe try picking easier words next time! 🤔",
                  style: TextStyle(
                    color: AppColor.secondryColorDark,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}