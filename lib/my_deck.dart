import 'package:flutter/material.dart';

import 'create deck.dart';

class Mydeck extends StatefulWidget {
  const Mydeck();

  @override
  State<Mydeck> createState() => _MydeckState();
}
class _MydeckState extends State<Mydeck> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "マイデッキ",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor:Colors.purple
      ),

      body: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Text("マイデッキ"),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Create_deck()),
              );
            },
                child: const Text("新規追加")),
            Container(
              color: Colors.white,
              height: 400,
              width: 300,
              child: const Text("マイデッキリスト"),

            )
          ],
        ),
      ),
    );
  }
}
