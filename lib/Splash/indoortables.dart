import 'package:flutter/material.dart';
class intables extends StatefulWidget {
  const intables({Key? key}) : super(key: key);

  @override
  State<intables> createState() => _tablesState();
}

class _tablesState extends State<intables> {
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
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Color.fromRGBO(205, 199, 190,1.0),
              child: Center(child: Text('${tablenumber++}')),
            );
          }
      ),
    );
  }
}
