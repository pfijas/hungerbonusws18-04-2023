import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restuarant/Splash/outdoortables.dart';

import 'Profilepage.dart';
import 'Tables.dart';
import 'deliverypage.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(length: 3,child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
          bottom: TabBar(
              tabs: [
                Row (children: [Icon(Icons.table_bar_rounded), SizedBox(width:5), Text("Table")]),
                Row (children: [Icon(Icons.delivery_dining), SizedBox(width:5), Text("Delivery")]),
                Row (children: [Icon(Icons.shopping_bag), SizedBox(width:5), Text("Parcel")]),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: ShapeDecoration (
                  shape: UnderlineInputBorder (
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0,
                          style: BorderStyle.solid
                      )
                  ),
              )
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.clear_all_rounded, size: 28,))
              ),
            ],),actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle_sharp,
              size:30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile_1(user: null,),));
            },
          )
        ],
        ),
        body:TabBarView(
          children: [
            // Center(child: Text("Table")),
            table_1(),
            CarouselWithIndicatorDemo(),
            CarouselWithIndicatorDemo()
          ],
        ),
      )
      )
        );
  }

}
