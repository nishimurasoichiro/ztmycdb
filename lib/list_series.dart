import 'package:flutter/material.dart';

import 'list_card.dart';
import 'list_stock.dart';

class List_series extends StatefulWidget {
  const List_series();

  @override
  State<List_series> createState() => _List_seriesState();
}
class _List_seriesState extends State<List_series> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "シリーズリスト",
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
            const SizedBox(
              height: 50,
            ),

            Container(
              color: Colors.black,
              height: 600,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: series_list.length,
                itemBuilder: (context, index) {
                  var key = series_list.keys.elementAt(index);
                  return Center(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => List_card(
                                series_list[key]["list_name"],
                              key,
                            )),
                           );
                          },
                      child: SizedBox(
                        height: 100,
                        width: 200,
                        child: FittedBox(
                            fit: BoxFit.contain,
                              child:Text(key,
                                style: const TextStyle(
                                  //fontSize: 64,
                                  color: Colors.black,
                                    ),
                              ),
                        ),
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
