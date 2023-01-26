import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:puzzle/models/BoardNumber.dart';

class Board extends StatefulWidget {
  final List<BoardNumber> boardNumbers;
  Board({required this.boardNumbers});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  void initState() {
    inspect(widget.boardNumbers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: 4,
      children: List.generate(
        widget.boardNumbers.length,
        (index) => Center(
          child: Text(
            widget.boardNumbers[index].value.toString(),
          ),
        ),
      ),
    ));
  }
}
