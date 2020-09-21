import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String word = "gamers";
  String chosenword = "ramble";
  List<List<int>> _list = List.generate(
    6,
    (yIndex) => List.generate(6, (xIndex) => ((yIndex * 6) + xIndex)),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.orangeAccent,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _list
                .map((y) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: y
                            .map((x) => Container(
                                  color: x ~/ 6 == 0
                                      ? word.contains(chosenword[x % 6])
                                          ? chosenword[x % 6] == word[x % 6]
                                              ? Colors.green
                                              : Colors.yellowAccent
                                          : Colors.grey
                                      : Colors.grey,
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: Text(
                                    x.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ))
                            .toList(),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
