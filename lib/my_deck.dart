import 'package:flutter/material.dart';
import 'package:ztmycdb2/list_stock.dart';

import 'create deck.dart';
import 'deck_view.dart';
import 'home_page.dart';

class Mydeck extends StatefulWidget {
  const Mydeck();

  @override
  State<Mydeck> createState() => _MydeckState();
}
class _MydeckState extends State<Mydeck> {


  var deck_name ;
  var check = false;

  void _onButtonPressed() {
    setState(() {
      Deck_list["$deck_name"] = [];

        Navigator.push (
        context,
        MaterialPageRoute(builder: (context) => Create_deck(
        deck_name,
            Deck_list["$deck_name"]
    ))
    );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(
              )
              ),
            );
                  }, child: const Text("ホーム")
            ),
            ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return Container(
                              height: 200,
                              child: Column(
                                children: [
                                const Text("デッキ名を指定"),
                                 SizedBox(height: 50,),
                                 TextField(
                                  decoration: const InputDecoration(
                                    hintText: "デッキ名を入力",
                                  ),
                                    onChanged: (String value) {
                                      setState(() {
                                        deck_name = value;
                                        check = value.isNotEmpty;
                                      });
                                    }
                                ),
                                  TextButton(
                                    //onPressed: check ? _onButtonPressed : null,
                                    onPressed: check == false ? null :(){
                                     _onButtonPressed();
                              },
                                    child: const Text("作成"),
                                  )
                              ],
                              ),
                            );
                          },
                        ),

                      ),
                    );
            },
                child: const Text("新規追加")
            ),
            Container(
              color: Colors.black,
              height: 600,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: Deck_list.length,
                itemBuilder: (context, index) {
                  var key = Deck_list.keys.elementAt(index);
                  return Container(
                    height: 50,
                    child: Card(
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          const SizedBox(width: 10,),
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
                                MaterialPageRoute(builder: (context) => Deck_View(
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
            )
          ],
        ),
      ),
    );
  }
}
