import 'package:flutter/material.dart';
import 'package:ztmycdb2/card_view.dart';

class List_card extends StatefulWidget {
  List_card( this.list_name, this.seriesname, {Key? key}) : super(key: key);
  Map list_name;
  String seriesname;
  @override
  State<List_card> createState() => _List_cardState();
}
class _List_cardState extends State<List_card> {

  get  seriesname => widget.seriesname;
  get  list_name => widget.list_name;


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
             Text("${seriesname}",
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
            Container(
              color: Colors.black,
              height: 600,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: list_name.length,
                itemBuilder: (context, index) {
                  var key = list_name.keys.elementAt(index);
                  return Container(
                    height: 50,
                    child: Card(
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          Container(
                            height:35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2), // 枠線の角丸
                              color: Colors.purple,
                            ), // Containerの見た目を変える
                            child:FittedBox(
                                  fit: BoxFit.contain,
                                  child:Text('$key',)
                              ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: 35,
                            width: 200,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child:Text('${list_name[key]["name"]}'),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Card_View(
                                      key,
                                      list_name,
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
