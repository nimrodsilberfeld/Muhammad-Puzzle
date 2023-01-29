import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:puzzle/models/BoardNumber.dart';

class NumberTile extends StatefulWidget {
  final BoardNumber boardNumber;
  final int boardPieceIndex;
  final double boardWidth;
  NumberTile({
    required this.boardNumber,
    required this.boardWidth,
    required this.boardPieceIndex,
  });

  @override
  State<NumberTile> createState() => _NumberTileState();
}

class _NumberTileState extends State<NumberTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.boardNumber.selectedAsAnswer
          ? Colors.green[200]
          : Colors.white54,
      child: InkWell(
        enableFeedback: true,
        onTap: () {
          print(widget.boardNumber.value);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            widget.boardNumber.value.toString(),
          ),
        ),
      ),
    );
  }
}
