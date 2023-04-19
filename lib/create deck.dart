import 'package:flutter/material.dart';

import 'card_view.dart';
import 'list_stock.dart';

class Create_deck extends StatefulWidget {
   Create_deck(this.deck_name,{super.key});
   String deck_name;

  
  @override
  State<Create_deck> createState() => _Create_deckState();
}
class _Create_deckState extends State<Create_deck> {

  bool isVisible = false;static  List<String> nameList = name_List;
  List<String> searchedNames = [];
  get  deck_name => widget.deck_name;


  void search(String text) {
    setState(() {
      if (text.trim().isEmpty) {
        searchedNames = [];
      } else {
        searchedNames = nameList.where((element) => element.contains(text)).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(
            "${deck_name}",
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
            Text("デッキ"),
            Container(
              color: Colors.black,
              height: 200,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: Deck_list[deck_name].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    child: Card(
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 35,
                            width: 200,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child:Text(Deck_list[deck_name][index]),
                            ),//
                          ),
                          Expanded(
                              child: SizedBox(
                                child:  Expanded(
                                    child: SizedBox(
                                      height: 28,
                                      width: 35,
                                      child: IconButton(
                                        color: Colors.black,
                                        onPressed: () {setState(() {
                                          Deck_list[deck_name].remove("${Deck_list[deck_name][index]}");
                                        });
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 15,
                                        ),
                                      ),
                                    )),
                              )),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.purple),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Card_View(
                                    Deck_list[deck_name][index]
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
            SizedBox(height: 20,),
        Column(
          children: [
            Text('検索フォーム', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              onChanged: search,
              decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16)),
            ),
            const SizedBox(height: 16),
            const Text(
                '検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
              Center(
                child: Container(
                  color: Colors.black,
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: searchedNames.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 30,
                        child: Card(
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),
                              SizedBox(
                                height: 28,
                                width: 200,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child:Text("${searchedNames[index]}"),
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                    height: 28,
                                    width: 35,
                                    child: IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        setState(() {
                                        Deck_list[deck_name].add("${searchedNames[index]}");
                                        });
                                      },
                                      icon: const Icon(
                                          Icons.add,
                                        size: 15,
                                      ),
                                    ),
                                  )
                              ),
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                                onPressed: (){
                                  //Navigator.push(
                                    // context,
                                    // MaterialPageRoute(builder: (context) => Card_View(
                                    //     searchedNames[index]
                                    // )
                                    // ),
                                  //);
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
              ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}
