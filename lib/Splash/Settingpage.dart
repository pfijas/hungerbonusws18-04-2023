import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Editprofilepage.dart';
import 'Profilepage.dart';
class setting_1 extends StatefulWidget {
  const setting_1({Key? key}) : super(key: key);

  @override
  State<setting_1> createState() => _setting_1State();
}

class _setting_1State extends State<setting_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading:  IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Settings",
          style: GoogleFonts.notoSerifLao(),

        ),
      ),
      body:
      Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("Food orders",
                style: GoogleFonts.robotoCondensed(fontSize: 20)),
              ),
            ),
            ListTile(
                leading: Icon(Icons.food_bank),
                title:Text("your orders"),
                trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading:Icon(Icons.favorite_border_outlined),
              title:Text("Favorite orders"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title:Text("Address Book"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title:Text("Online oredering help"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            Card(
              child: ListTile(
                title: Text("Dining",
                    style: GoogleFonts.robotoCondensed(fontSize: 20)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title:Text("Your transaction"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading:Icon(Icons.card_giftcard),
              title:Text("your dining rewards"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.table_bar_rounded),
              title:Text("Table reservation"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title:Text("Dining help"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title:Text("Table reservation help"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.quiz_outlined),
              title:Text("Frequently asked quetion"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            Card(
              child: ListTile(
                title: Text("More",
                    style: GoogleFonts.robotoCondensed(fontSize: 20)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title:Text("Choose language"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading:Icon(Icons.contact_support_rounded),
              title:Text("About"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title:Text("Sent feedback"),
              trailing:Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),

      )

    );
  }
}
