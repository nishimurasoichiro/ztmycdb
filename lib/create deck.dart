import 'package:flutter/material.dart';

class Create_deck extends StatefulWidget {
  const Create_deck({super.key});

  
  @override
  State<Create_deck> createState() => _Create_deckState();
}
class _Create_deckState extends State<Create_deck> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "カードリスト",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          backgroundColor:Colors.purple
      ),

      body: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children:  [
            SizedBox(height: 50,),
            Container(
              height: 100,
                width: 300,
                color: Colors.white,
                child: Text("検索ボックス・テキストフィールドとか"),
            ),
            SizedBox(height: 50,),
            Container(
              height: 400,
              width: 300,
              color: Colors.white,
              child: Text("デッキのカードリスト"),
            )

          ],
        ),
      ),
    );
  }
}
