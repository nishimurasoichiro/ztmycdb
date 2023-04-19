import 'package:flutter/material.dart';

import 'list_stock.dart';

class Card_View extends StatefulWidget {
  Card_View(this.card_name, {Key? key}) : super(key: key);
  String card_name;


  @override
  State<Card_View> createState() => _Card_ViewState();
}
class _Card_ViewState extends State<Card_View> {

  get  card_name => widget.card_name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "${card_name}",
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
                      Text("カード名　: ${card_name}"),
                      Text("属性　: ${Card_list[card_name]["attribute"]}"),
                      Text("効果　: ${Card_list[card_name]["effect"]}"),
                      Text("カードの種類　: ${Card_list[card_name]["kind"]}"),
                      Text("カード番号 : ${Card_list[card_name]["number"]}"),
                      Text("パワー　: ${Card_list[card_name]["power"]}"),
                      Text("パワーコスト : ${Card_list[card_name]["power_cost"]}"),
                      Text("パワー　DAY : ${Card_list[card_name]["power_day"]}"),
                      Text("パワー　NIGHT : ${Card_list[card_name]["power_night"]}"),
                      Text("レアリティ　: ${Card_list[card_name]["rarity"]}"),
                      Text("収録弾　: ${Card_list[card_name]["seties"]}"),
                      Text("時間　: ${Card_list[card_name]["time"]}"),
      ]
      ),
            ),
          ],
        ),
      ),
    );
  }
}
