import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:restuarant/Authentication/google_signin.dart';

class Editprofile extends StatefulWidget {
  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _editFormKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  // DateTime get pickedDate => DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        title:Text("Complete Your Profile",style: GoogleFonts.notoSerifLao(),),
      ),
      body: ListView(
        children: [
          Form(
              key: _editFormKey,
              child: Column(
                children: [
                   Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('$imageUrl'),
                      //child: ,
                      radius: 55,
                      //backgroundImage:NetworkImage('$imageUrl'),
                    ),
                  ),
                  Center(
                    child: Text("Edit photo", style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            makeInputName(label: " Name"),
                            makeInputPhonenumber(label: " Phone Number"),
                            makeInputEmail(label: " Email"),
                            makeInputBirthday(label: " Birthday"),
                            // makeInputGender(label: " Gender"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                padding: const EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: const Border(
                                        bottom: BorderSide(color: Colors.black),
                                        top: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                        left: BorderSide(color: Colors.black))),
                                child: MaterialButton(
                                  focusColor: Colors.red,
                                  minWidth: 30,
                                  height: 40,
                                  onPressed: () {
                                    if (_editFormKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  color: Colors.redAccent,
                                  //color: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: const Text(
                                    "Update Profile",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ))
        ],
      ),
    );
  }

  // TextFormField for Full Name
  Widget makeInputName({label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: nameController,
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              //allow upper and lower case alphabets and space
              return "Enter Correct Name";
            } else {
              return null;
            }
          },
          obscureText: obsureText,
          decoration: const InputDecoration(
            hintText: "Enter full name",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

// TextFormField for email

  Widget makeInputEmail({label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: emailController,
          validator: (value) {
            if (value!.isEmpty ||
                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return "Enter Correct Email Address";
            } else {
              return null;
            }
          },
          obscureText: obsureText,
          decoration: const InputDecoration(
            hintText: "Enter valid email id",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

// TextFormField for Birthday
  Widget makeInputBirthday({label, obsureText = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        controller: dateinput,
        //editing controller of this TextField
        decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
        readOnly: true,
        //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            print(
                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(
                formattedDate); //formatted date output using intl package =>  2021-03-16
            //you can implement different kind of Date Format here according to your requirement

            setState(() {
              dateinput.text =
                  formattedDate; //set output date to TextField value.
            });
          }else {
            print("Date is not selected");
          }
        },
      ),SizedBox(
        height: 30,
      ),
    ]);
  }

// TextFormField for phone number

  Widget makeInputPhonenumber({label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: phoneController,
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
              return "Enter correct phone number";
            } else {
              return null;
            }
          },
          obscureText: obsureText,
          decoration: const InputDecoration(
            hintText: "Enter Phone Number",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
