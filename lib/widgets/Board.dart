import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:puzzle/models/BoardNumber.dart';
import 'package:puzzle/widgets/NumberTile.dart';

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

  changeTest() => {
        // widget.boardNumbers;
      };

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double boardSpacing = 4;
    final boardHeight = size.height * 0.5;
    final boardWidth = size.width;
    final ratioHeight = boardHeight / 100;
    final ratioHeightTest = boardHeight / (100 - boardSpacing);

    List<String> test = ["1(0)", "2(0)", "3(0)", "4(0)"];

    return Container(
      height: boardHeight,
      width: boardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //main board + right side
            width: boardWidth,
            height: boardHeight * 0.8,
            color: Colors.grey,
            child: Row(
              children: [
                Container(
                  //main board
                  height: boardHeight,
                  width: boardWidth * 0.8,
                  // color: Colors.grey,
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 4,
                    shrinkWrap: false,
                    childAspectRatio: (boardWidth / ratioHeight) /
                        (boardHeight / ratioHeight),
                    mainAxisSpacing: boardSpacing,
                    crossAxisSpacing: boardSpacing,
                    children: List.generate(
                      widget.boardNumbers.length,
                      (index) => NumberTile(
                        boardNumber: widget.boardNumbers[index],
                        boardWidth: boardWidth,
                        boardPieceIndex: index,
                      ),
                    ),
                  ),
                ),
                Container(
                  //right side
                  color: Colors.amber,
                  height: boardHeight,
                  width: boardWidth * 0.2,
                  child: GridView.count(
                    // padding: EdgeInsets.symmetric(vertical: 14),
                    crossAxisCount: 1,
                    childAspectRatio: (boardWidth / ratioHeight) /
                        (boardHeight / ratioHeightTest),

                    mainAxisSpacing: boardSpacing,
                    children: List.generate(
                      test.length,
                      (index) => Expanded(
                        child: Container(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              test[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: boardHeight * 0.2,
            width: boardWidth * 0.80,
            color: Colors.blue,
            child: Container(
              color: Colors.green,
              child: ListView.separated(
                itemCount: test.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    VerticalDivider(
                  width: 0,
                  thickness: boardSpacing,
                  // color: Colors.black,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.zero,
                    // width: (boardWidth * 0.8) / 4,
                    child: Center(
                      child: Text(
                        test[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
