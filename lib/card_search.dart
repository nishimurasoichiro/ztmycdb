import 'package:flutter/material.dart';
import 'CardViews/card_view.dart';
import 'list_stock.dart';


class Card_Search extends StatefulWidget {
  const Card_Search({super.key});

  @override
  State<Card_Search> createState() => _Card_SearchState();
}

class _Card_SearchState extends State<Card_Search> {

  bool isVisible = false;
  List searchedNames = [];

  bool _isYellow = false;

  void search(String text) {
    setState(() {
      if (text.trim().isEmpty) {
        searchedNames = [];
      } else {
        for(var value in numberList){
          if (Card_List[value]["name"].contains(text)){

            searchedNames.add(value);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  const Text(
            "検索",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.purple
      ),
      body: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Text('検索フォーム', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              onChanged: search,
              decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16)),
            ),
            const SizedBox(height: 16),

            // ElevatedButton(
            //     onPressed: (){
            //       showDialog(
            //         context: context,
            //         builder: (context) => AlertDialog(
            //           content: StatefulBuilder(
            //             builder: (BuildContext context, StateSetter setState) {
            //               return SizedBox(
            //                 height: 500,
            //                 width:  300,
            //                 child: Column(
            //                   children: [
            //                     const Text("詳細検索"),
            //                     const SizedBox(height: 30,),
            //                     Row(
            //                       children: [
            //                         const Text("属性1"),
            //                             TextButton(
            //                                 onPressed: ()=> setState(() => _isYellow = !_isYellow),
            //                               style: ElevatedButton.styleFrom(
            //                                 backgroundColor: _isYellow ? Colors.yellow : Colors.blue,
            //                               ),
            //                                 child: const Text("A"),
            //                             ),
            //                         TextButton(
            //                           onPressed: ()=> setState(() => _isYellow = !_isYellow),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: _isYellow ? Colors.yellow : Colors.blue,
            //                           ),
            //                           child: const Text("B"),
            //                         ),
            //                             TextButton(onPressed: (){}, child: const Text("C")),
            //                             TextButton(onPressed: (){}, child: const Text("D")),
            //                       ],
            //                     ),
            //                     const SizedBox(height: 10,),
            //                     Row(
            //                       children: [
            //                         const Text("属性2"),
            //                         TextButton(
            //                           onPressed: ()=> setState(() => _isYellow = !_isYellow),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: _isYellow ? Colors.yellow : Colors.blue,
            //                           ),
            //                           child: const Text("A"),
            //                         ),
            //                         TextButton(
            //                           onPressed: ()=> setState(() => _isYellow = !_isYellow),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: _isYellow ? Colors.yellow : Colors.blue,
            //                           ),
            //                           child: const Text("B"),
            //                         ),
            //                         TextButton(onPressed: (){}, child: const Text("C")),
            //                         TextButton(onPressed: (){}, child: const Text("D")),
            //                       ],
            //                     ),
            //                     const SizedBox(height: 10,),
            //                     Row(
            //                       children: [
            //                         const Text("属性3"),
            //                         TextButton(
            //                           onPressed: ()=> setState(() => _isYellow = !_isYellow),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: _isYellow ? Colors.yellow : Colors.blue,
            //                           ),
            //                           child: const Text("A"),
            //                         ),
            //                         TextButton(
            //                           onPressed: ()=> setState(() => _isYellow = !_isYellow),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: _isYellow ? Colors.yellow : Colors.blue,
            //                           ),
            //                           child: const Text("B"),
            //                         ),
            //                         TextButton(onPressed: (){}, child: const Text("C")),
            //                         TextButton(onPressed: (){}, child: const Text("D")),
            //                       ],
            //                     ),
            //                     const SizedBox(height: 10,),
            //                   ],
            //                 ),
            //               );
            //             },
            //           ),
            //
            //         ),
            //       );
            //     },
            //     child: const Text("詳細検索")
            // ),
            const Text('検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child:
              Center(
                child: Container(
                  color: Colors.black,
                  height: 600,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: searchedNames.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 50,
                        child: Card(
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),
                              SizedBox(
                                height: 35,
                                width: 220,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("${Card_List[searchedNames[index]]["name"]}"),

                                ),
                              ),
                              const Expanded(child: SizedBox()),
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
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void toggleShowText() {
    isVisible = !isVisible;
  }
}
