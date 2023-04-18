import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Editprofilepage.dart';
import 'Editprofilepage.dart';
import 'Editprofilepage.dart';
class settings_2 extends StatefulWidget {
  const settings_2({Key? key}) : super(key: key);

  @override
  State<settings_2> createState() => _settings_2State();
}

class _settings_2State extends State<settings_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:  IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Settings",
          style: GoogleFonts.notoSerifLao(),
        ),
      ),
      body: Card(
        child: ListView(
          children: [
            ListTile(
              title: Text("Add a Place\nIn case we're missing something"),
            ),
            ListTile(
              title: Text("Places you've added\nSee all the places you've added so far"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Editprofile(),));
              },
              title: Text("Edit profile\nChange your name,description and profile photo"),
            ),
            ListTile(
              title: Text("Notification Settings \nDefine what alerts and notification you want to see"),
            ),
            ListTile(
              title: Text("Account settings\nDelete your account."),
            ),
          ],
        ),
      ),

    );
  }
}
