import 'package:flutter/material.dart';

import '../CardViews/card_view.dart';
import '../list_stock.dart';
import 'my_deck.dart';

class Create_deck extends StatefulWidget {
   Create_deck(this.deck_name, this.deck_List,{super.key});
   String deck_name;
   List deck_List;

  
  @override
  State<Create_deck> createState() => _Create_deckState();
}
class _Create_deckState extends State<Create_deck> {

  get  deck_name => widget.deck_name;
  get  newDeck => widget.deck_List;

  bool isVisible = false;static  Map nameList = name_List;
  List searchedNames = [];

  void search(String text) {
    setState(() {
      if (text.trim().isEmpty) {
        searchedNames = [];
      } else {
        for(var value in numberList){
          if (nameList[value].contains(text)){
            searchedNames.add(value);
          }
        }
      }
    });
  }

  void save(){
    Deck_list[deck_name] == newDeck;
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Mydeck(
    )
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  Text(
            "$deck_name",
            style: const TextStyle(
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
            const Text("デッキ"),
            Row(
              children: [
                ElevatedButton(
                    onPressed: (){
                      save();
                    },
                    child: const Text("保存")
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mydeck(
                        )
                        ),
                      );
                    },
                    child: const Text("戻る")
                )
              ],
            ),

            Container(
              color: Colors.black,
              height: 200,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: newDeck.length,
                itemBuilder: (context, index) {
                  return SizedBox(
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
                              child:Text("${Card_List[newDeck[index]]["name"]}"),

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
                                        onPressed: () {
                                          setState(() {
                                          newDeck.remove(Deck_list[deck_name][index]);
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
                                    newDeck[index]
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
            const SizedBox(height: 20,),
        Column(
          children: [
            const Text('検索フォーム', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              onChanged: search,
              decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16)),
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
                      return SizedBox(
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
                                  child: Text("${Card_List[searchedNames[index]]["name"]}"),
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
                                          newDeck.add(searchedNames[index]);
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Card_View(
                                        searchedNames[index] as int
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
              ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}