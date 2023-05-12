import 'package:flutter/material.dart';
import 'package:ztmycdb2/CardViews/card_view.dart';

import '../list_stock.dart';

class CardListView2 extends StatefulWidget {
 const CardListView2({super.key});

  @override
  State<CardListView2> createState() => _CardListView2State();
}
class _CardListView2State extends State<CardListView2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  const Text(
            "全カードリスト",
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
          children: [
            const SizedBox(
              height: 50,
            ),

            Container(
              color: Colors.black,
              height: 550,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: numberList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 35,
                            width: 200,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child:Text("${Card_List[numberList[index]]["name"]}",style: const TextStyle(fontSize: 20,),),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Card_View(
                                    numberList[index]
                                )
                                ),
                              );
                            },
                            child: const Text("詳細",
                            ),

                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
