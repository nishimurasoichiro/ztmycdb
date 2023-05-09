import 'package:flutter/material.dart';

import 'list_card.dart';
import 'list_stock.dart';

class SeriesListView extends StatefulWidget {
  const SeriesListView( {Key? key}) : super(key: key);
  @override
  State<SeriesListView> createState() => _SeriesListViewState();
}
class _SeriesListViewState extends State<SeriesListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "シリーズリスト",
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
            const SizedBox(
              height: 50,
              width: 200,
            ),
            Container(
              color: Colors.black,
              height: 550,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),

              child: ListView.builder(
                itemCount: series_list.length,
                itemBuilder: (context, index) {
                  var key = series_List.keys.elementAt(index);
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
                              child:Text("${series_List[key]["name"]}"),
                            ),//

                          ),
                          const Expanded(child: SizedBox()),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CardListView(
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
