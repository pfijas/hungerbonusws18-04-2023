import 'package:flutter/material.dart';

import 'deliverypage.dart';

class tables extends StatefulWidget {
  const tables({Key? key}) : super(key: key);

  @override
  State<tables> createState() => _tablesState();
}

class _tablesState extends State<tables> {
  var tablenumber=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading:  IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      backgroundColor: Colors.grey,
      body:
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarouselWithIndicatorDemo(),));
        },
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color.fromRGBO(205, 199, 190,1.0),
                  child: Center(child: Text('${tablenumber++}')),
                ),
              );
            }
        ),
      ),
    );
  }
}