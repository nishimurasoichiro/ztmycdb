import 'package:flutter/material.dart';
import 'package:ztmycdb2/CardViews/card_view.dart';

import '../list_stock.dart';

class CardListView1 extends StatefulWidget {
  CardListView1(this.series_num,  {Key? key}) : super(key: key);
  int series_num;

  @override
  State<CardListView1> createState() => _CardListView1State();
}
class _CardListView1State extends State<CardListView1> {

  get  series_num => widget.series_num;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(
            "${series_List[series_num]["name"]}",
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
          children: [
            const SizedBox(
              height: 50,
            ),

            Container(
              color: Colors.black,
              height: 550,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: series_List[series_num]["how"],
                itemBuilder: (context, index) {
                  return SizedBox(
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
                              child:Text("${Card_List[series_num * 1000 + (index + 1)]["name"]}",style: const TextStyle(fontSize: 20,),),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Card_View(
                                      series_num * 1000 + (index + 1)
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
