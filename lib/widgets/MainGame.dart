import 'package:flutter/material.dart';
import 'package:puzzle/widgets/Board.dart';
import 'package:puzzle/models/BoardNumber.dart';
import 'dart:math';
import 'dart:developer';

class MainGame extends StatefulWidget {
  const MainGame();

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  List<BoardNumber> boardNumbers = [];
  clearBoard() {
    setState(() {
      boardNumbers = [];
    });
  }

  generateRandomBoard() {
    clearBoard();
    for (var i = 0; i < 16; i++) {
      Random random = new Random();
      int randomNumber = random.nextInt(2);
      bool isSetAsAnswer = randomNumber == 1;
      int randomValue = random.nextInt(9) + 1;
      setState(() {
        boardNumbers = [
          ...boardNumbers,
          BoardNumber(randomValue, isSetAsAnswer)
        ];
      });
    }
  }

  @override
  void initState() {
    generateRandomBoard();
    // inspect(boardNumbers);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Board(
        boardNumbers: boardNumbers,
      ),
    );
  }
}
