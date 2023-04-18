import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restuarant/Splash/settings_2.dart';
import 'package:restuarant/Splash/signup.dart';
import '../Authentication/google_signin.dart';
import 'Editprofilepage.dart';
import 'Editprofilepage.dart';
import 'Settingpage.dart';
import 'loginpage.dart';

class Profile_1 extends StatefulWidget {
  const Profile_1({Key? key, required user}) : super(key: key);

  @override
  State<Profile_1> createState() => _Profile_1State();
}

class _Profile_1State extends State<Profile_1> {
  bool _isSigningOut = false;
  User? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
          title: Text("Profile", style: GoogleFonts.notoSerifLao()),
          backgroundColor: Colors.black26,
          elevation: 100,
        ),
        body:
        Container(
          color: Colors.blueGrey,
          height: 800,
          child: SingleChildScrollView(
            child: Column(children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage("$imageUrl"),
              ),
              InkWell(
                child: TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Edit profile photo"),
                      Icon(Icons.edit)
                    ],
                  ),
                ),
                onTap: () => setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Editprofile()));
                }),
              ),
              SizedBox(
                height: 50,
                child:  Column(
                  children: [
                   Text(
                      "$name",
                      style: GoogleFonts.lora(),
                    )
                  ],
                )

              ),
              Container(
                height: 500,
                child: ListView(
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      elevation: 50,
                      child: Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text("Food orders",
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 20)),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.food_bank),
                            title: Text("your orders"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.favorite_border_outlined),
                            title: Text("Favorite orders"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.book_outlined),
                            title: Text("Address Book"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.help_center),
                            title: Text("Online oredering help"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Dining",
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 20)),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.adjust_rounded),
                            title: Text("Your transaction"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.card_giftcard),
                            title: Text("your dining rewards"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.table_bar_rounded),
                            title: Text("Table reservation"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.help_center),
                            title: Text("Dining help"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.help_center),
                            title: Text("Table reservation help"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          ListTile(
                            leading: Icon(Icons.quiz_outlined),
                            title: Text("Frequently asked quetion"),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => settings_2(),
                              ));
                            },
                            child: const ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Settings"),
                              trailing: Icon(Icons.keyboard_arrow_right_sharp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  _isSigningOut = true;
                                });
                                await FirebaseAuth.instance.signOut();
                                setState(() {
                                  _isSigningOut = false;
                                });
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginDemo(),
                                  ),
                                );
                              },
                              child: const Text("      Log Out     ",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
