import 'package:flutter/material.dart';
class cart_1 extends StatefulWidget {
  const cart_1({Key? key}) : super(key: key);

  @override
  State<cart_1> createState() => _cart_1State();
}

class _cart_1State extends State<cart_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Card(
          child: Column(

          ),
        ),
      ),
    );


  }
}
