import 'package:flutter/material.dart';

class Card_View extends StatefulWidget {
  Card_View(this.card_num,  this.list_name, {Key? key}) : super(key: key);
  int card_num;
  Map list_name;

  @override
  State<Card_View> createState() => _Card_ViewState();
}
class _Card_ViewState extends State<Card_View> {

  get  card_num => widget.card_num;
  get  list_name => widget.list_name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "${list_name[card_num]["name"]}",
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
                      Text("カード名　: ${list_name[card_num]["name"]}"),
                      Text("属性　: ${list_name[card_num]["attribute"]}"),
                      Text("効果　: ${list_name[card_num]["effect"]}"),
                      Text("カードの種類　: ${list_name[card_num]["kind"]}"),
                      Text("カード番号 : ${list_name[card_num]["number"]}"),
                      Text("パワー　: ${list_name[card_num]["power"]}"),
                      Text("パワーコスト : ${list_name[card_num]["power_cost"]}"),
                      Text("パワー　DAY : ${list_name[card_num]["power_day"]}"),
                      Text("パワー　NIGHT : ${list_name[card_num]["power_night"]}"),
                      Text("レアリティ　: ${list_name[card_num]["rarity"]}"),
                      Text("収録弾　: ${list_name[card_num]["seties"]}"),
                      Text("時間　: ${list_name[card_num]["time"]}"),
      ]
      ),
            ),
          ],
        ),
      ),
    );
  }
}
