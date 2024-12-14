import 'dart:math';

import 'package:flutter/material.dart';

import '../Ui/colors.dart';
import '../widget/figure_image.dart';
import 'Pages/GameOverPage.dart';
import 'Pages/HomePage.dart';
import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeApp extends StatefulWidget {
  final List<String> words;

  const HomeApp({super.key, required this.words});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late String word;

  @override
  void initState() {
    super.initState();
    _loadWords();
    _restartGame();
  }

  String splitCamelCase(String input) {
    return input.replaceAllMapped(RegExp(r'([a-z0-9])([A-Z])'), (Match match) {
      return match.group(1)! + " " + match.group(2)!.toLowerCase();
    }).toUpperCase();
  }

  void _loadWords() {
    if (widget.words.isEmpty) {
      word = "";
      Game.tries = 0;
      Game.selectedChar.clear();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("No words available. Please select a valid category."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      word = widget.words[Random().nextInt(widget.words.length)].toUpperCase();
    }
  }

  void _restartGame() {
    setState(() {
      if (widget.words.isNotEmpty) {
        word = widget.words[Random().nextInt(widget.words.length)].toUpperCase();
        Game.tries = 0;
        Game.selectedChar.clear();
      } else {
        word = "";
        Game.tries = 0;
        Game.selectedChar.clear();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("No words available. Please select a valid category."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  void _checkGameState() {
    if (word.split('').every((letter) => Game.selectedChar.contains(letter))) {
      _showEndDialog("You Win!", AppColor.primaryColorDark);
    } else if (Game.tries >= 6) {
      setState(() {
        Game.selectedChar.addAll(word.split(' ').join('').split(''));
      });
      Future.delayed(Duration(seconds: 3), () {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameOverScreen()),
        );
        _restartGame();
      });
    }
  }

  void _showEndDialog(String message, Color color) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.secondryColor,
          title: Text(
            message,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          content: Text("The word was: $word"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: Text(
                "Play Again",
                style: TextStyle(
                  color: AppColor.primaryColorDark,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColorDark,
      appBar: AppBar(
        title: Text("HangMan"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColorDark,
      ),
      body: SingleChildScrollView(  // Make the whole page scrollable vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  figureImage(Game.tries >= 0, "assets/hang.png"),
                  figureImage(Game.tries >= 1, "assets/head.png"),
                  figureImage(Game.tries >= 2, "assets/body.png"),
                  figureImage(Game.tries >= 2 && Game.tries != 4 && Game.tries != 5 && Game.tries != 6, "assets/happyhead.png"),
                  figureImage(Game.tries >= 3, "assets/la.png"),
                  figureImage(Game.tries >= 4, "assets/ra.png"),
                  figureImage(Game.tries >= 4 && Game.tries != 5 && Game.tries != 6, "assets/neutralhead.png"),
                  figureImage(Game.tries >= 5, "assets/ll.png"),
                  figureImage(Game.tries >= 5 && Game.tries != 6, "assets/sadhead.png"),
                  figureImage(Game.tries == 6, "assets/rl.png"),
                  figureImage(Game.tries == 6, "assets/deadface.png"),
                ],
              ),
            ),
            // Word display section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,  // Enable horizontal scrolling if needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: word.split(' ').map((wordPart) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),  // Padding between words
                    child: Wrap(
                      alignment: WrapAlignment.center,  // Align items to the center
                      spacing: 8.0,  // Space between each letter box
                      runSpacing: 8.0,  // Space between lines of letters
                      children: wordPart.split('').map((e) {
                        double screenWidth = MediaQuery.of(context).size.width;
                        double letterWidth = (screenWidth - 40) / wordPart.length;  // Calculate the width dynamically
                        letterWidth = letterWidth.clamp(30.0, 50.0);  // Limit the width to avoid too small letters

                        return Container(
                          width: letterWidth,
                          height: letterWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 6.0),  // Margin between letter boxes
                          decoration: BoxDecoration(
                            color: AppColor.secondryColorDark,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          alignment: Alignment.center,
                          child: Visibility(
                            visible: e == " " || Game.selectedChar.contains(e.toUpperCase()),  // Show letter or space if guessed
                            child: Text(
                              e == " " ? " " : (Game.selectedChar.contains(e.toUpperCase()) ? e : "_"),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: letterWidth * 0.6,  // Adjust font size based on width
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            )
            ,
            // Keyboard section
            SizedBox(
              width: double.infinity,
              height: 250.0,
              child: GridView.count(
                crossAxisCount: 7,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(7.0),
                children: List.generate(26, (index) {
                  String e = String.fromCharCode(65 + index);
                  return RawMaterialButton(
                    onPressed: Game.selectedChar.contains(e)
                        ? null
                        : () {
                      setState(() {
                        Game.selectedChar.add(e);
                        if (!word.split('').contains(e)) {
                          Game.tries++;
                        }
                        _checkGameState();
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    fillColor: Game.selectedChar.contains(e)
                        ? AppColor.primaryColor
                        : AppColor.secondryColorDark,
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: _restartGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.teaGreen,
                ),
                child: Text(
                  "Restart Game",
                  style: TextStyle(
                    color: AppColor.primaryColorDark,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
