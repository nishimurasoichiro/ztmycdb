import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_view.dart';
import 'list_stock.dart';


class Card_Search extends StatefulWidget {
  const Card_Search({super.key});

  @override
  State<Card_Search> createState() => _Card_SearchState();
}
class _Card_SearchState extends State<Card_Search> {

  bool isVisible = false;static  List<String> nameList = name_List;
  List<String> searchedNames = [];


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
            Text('検索フォーム', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              onChanged: search,
              decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16)),
            ),
            const SizedBox(height: 16),
            const Text(
                '検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
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
                      return Container(
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
                                  child:Text("${searchedNames[index]}"),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Card_View(
                                        searchedNames[index]
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
