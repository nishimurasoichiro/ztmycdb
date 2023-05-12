import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztmycdb2/CardViews/list_card_all.dart';
import 'package:ztmycdb2/DeckViews/my_deck.dart';
import 'CardViews/list_series.dart';
import 'card_search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                child: Column(
                  children:  [
                     Image.asset('images/ZTMY_card_icon.png'),
                   ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(height: 50, width: 200,
              child:ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Card_Search()),
                  );},
                child: const Text(
                  "検索",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(height: 50, width: 200,
              child:ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardListView2()),
                  );},
                child: const Text(
                  "全カードリスト",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(height: 50, width: 200,
              child:ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeriesListView()),
                  );},
                child: const Text(
                  "収録リスト",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 200,
              child:ElevatedButton(
              onPressed: (){},
              child: const Text("遊び方",
              style: TextStyle(
                fontSize: 20,
              ),),
            ),
            ),

            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 200,
              child:ElevatedButton(
                onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mydeck()),
                    );},
                child: const Text("マイデッキ",
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
