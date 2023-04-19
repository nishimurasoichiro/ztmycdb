import 'package:flutter/material.dart';
import 'package:ztmycdb2/card_view.dart';

import 'card_search.dart';
import 'list_stock.dart';

class List_card extends StatefulWidget {
  List_card( {Key? key}) : super(key: key);
  @override
  State<List_card> createState() => _List_cardState();
}
class _List_cardState extends State<List_card> {

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
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child:ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Card_Search()),
                  );
                },
                child: const Text("検索→",
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ),
            ),
            Container(
              color: Colors.black,
              height: 600,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),

              child: ListView.builder(
                itemCount: Card_list.length,
                itemBuilder: (context, index) {
                  var key = Card_list.keys.elementAt(index);
                  return Container(
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
                              child:Text('$key'),
                            ),//

                          ),
                          const Expanded(child: SizedBox()),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Card_View(
                                      key
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
