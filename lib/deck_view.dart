import 'package:flutter/material.dart';
import 'card_view.dart';
import 'create deck.dart';
import 'list_stock.dart';
import 'my_deck.dart';

class Deck_View extends StatefulWidget {
  Deck_View(this.deck_name, {Key? key}) : super(key: key);
  String deck_name;


  @override
  State<Deck_View> createState() => _Deck_ViewState();
}
class _Deck_ViewState extends State<Deck_View> {

  get  deck_name => widget.deck_name;

  void Deck_delete(String deck_name){
    Deck_list.remove("${deck_name}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Mydeck()
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "${deck_name}",
            style: const TextStyle(
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
            children:  [
            const Text("デッキリスト"),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Create_deck(
                      deck_name,
                        Deck_list["$deck_name"]
                    )
                    ),
                  );
                },
                child: const Text("編集",
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: (){
                  Deck_delete("$deck_name");
                },
                child: const Text("削除",
                ),
              ),

        Container(
          color: Colors.black,
          height: 600,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: Deck_list["$deck_name"].length,
            itemBuilder: (context, index) {
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
                          // child:Text("${Deck_list[deck_name][index]}"),
                          child:Text("${Card_List[Deck_list[deck_name][index]]["name"]}"),

                        ),//
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple),
                        ),
                        onPressed: ()async{
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Card_View(
                                Deck_list["${deck_name}"][index]
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
        ]
      ),
      ),
    );
  }
}
