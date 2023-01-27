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
    final Size size = MediaQuery.of(context).size;
    final boardHeight = size.height * 0.5;
    final boardWidth = size.width;
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
            color: Colors.yellowAccent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //main board
                  height: boardHeight * 0.8,
                  width: boardWidth * 0.8,
                  color: Colors.grey,
                  child: Center(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: List.generate(
                        widget.boardNumbers.length,
                        (index) => Container(
                          child: Material(
                            child: InkWell(
                              enableFeedback: true,
                              onTap: () {
                                print(widget.boardNumbers[index].value);
                              },
                              child: Container(
                                width: boardWidth * 0.20,
                                height: boardWidth * 0.20,
                                child: Center(
                                  child: Text(
                                    widget.boardNumbers[index].value.toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //right side
                    color: Colors.amber,
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        test.length,
                        (index) => Center(
                          child: Text(
                            test[index],
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
            height: boardHeight * 0.15,
            width: boardWidth * 0.80,
            color: Colors.blue,
            child: Center(
              child: Container(
                width: boardWidth * 0.65,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: test
                      .map(
                        (e) => Text(e),
                      )
                      .toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
