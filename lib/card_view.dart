import 'package:flutter/material.dart';

import 'list_stock.dart';

class Card_View extends StatefulWidget {
  Card_View(this.card_num, {Key? key}) : super(key: key);
  int  card_num;


  @override
  State<Card_View> createState() => _Card_ViewState();
}
class _Card_ViewState extends State<Card_View> {

  get  card_num => widget.card_num;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "${Card_List[card_num]["name"]}",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor:Colors.purple
      ),

      body: Container(
        color: Colors.purple,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              color: Colors.white,
              height: 350,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(10),
                child:Column(
                    children:[
                      Text("カード名　: ${Card_List[card_num]["name"]}"),
                      Text("属性　: ${Card_List[card_num]["attribute"]}"),
                      Text("効果　: ${Card_List[card_num]["effect"]}"),
                      Text("カードの種類　: ${Card_List[card_num]["kind"]}"),
                      Text("カード番号 : ${Card_List[card_num]["number"]}"),
                      Text("パワー　: ${Card_List[card_num]["power"]}"),
                      Text("パワーコスト : ${Card_List[card_num]["power_cost"]}"),
                      Text("パワー　DAY : ${Card_List[card_num]["power_day"]}"),
                      Text("パワー　NIGHT : ${Card_List[card_num]["power_night"]}"),
                      Text("レアリティ　: ${Card_List[card_num]["rarity"]}"),
                      Text("収録弾　: ${Card_List[card_num]["seties"]}"),
                      Text("時間　: ${Card_List[card_num]["time"]}"),

                    ]
      ),
            ),
          ],
        ),
      ),
    );
  }
}
