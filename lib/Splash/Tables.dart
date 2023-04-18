import 'package:flutter/material.dart';
import 'package:restuarant/Splash/outdoortables.dart';

import 'indoortables.dart';

class table_1 extends StatefulWidget {
  const table_1({Key? key}) : super(key: key);

  @override
  State<table_1> createState() => _table_1State();
}

class _table_1State extends State<table_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  height: 180,
                  fit: BoxFit.fill,
                  'https://firebasestorage.googleapis.com/v0/b/restaurant-938.appspot.com/o/foodimages%2Ftableimage.jpg?alt=media&token=af389b6e-8e9b-4fb6-978a-f5377a9138bb'),
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Choose your table",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Where you want to eat?")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => tables(),));
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Image.asset('assets/images/terrace.png',
                                  width: 100),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Center(child: Text("Outdoor")),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              intables(),));
                        });
                      },
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
                            child: Container(
                              child: Image.asset('assets/images/table.png',
                                  height: 83, width: 100),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: Center(child: Text("Indoor")),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
