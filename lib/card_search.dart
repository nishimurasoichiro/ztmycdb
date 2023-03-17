import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztmycdb2/my_deck.dart';
import 'list_series.dart';

class Card_Search extends StatefulWidget {
  const Card_Search({super.key});

  @override
  State<Card_Search> createState() => _Card_SearchState();
}
class _Card_SearchState extends State<Card_Search> {

  bool isVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "検索",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.purple
      ),
      body: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 300,
                    child: TextField()
                ),
                TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    child:Text("検索")),
              ],
            ),
            TextButton(
              onPressed: () {
                setState(toggleShowText);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white
              ),
              child: const Text('条件を絞る'),
            ),
            Visibility(
              visible: isVisible, // デフォルトはfalseなので非表示になる
              child: Container(
                color: Colors.white,
                width: 400,
                height: 300,
                child: Column(
                  children: [
                    Text("あいうえお"),
                    Text("かきくけこ"),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void toggleShowText() {
    isVisible = !isVisible;
  }
}
