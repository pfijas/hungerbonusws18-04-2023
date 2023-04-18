import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restuarant/Authentication/email_password.dart';

import 'HomePage.dart';
import 'loginpage.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //Form key to validate
  final _singUpFormKey = GlobalKey<FormState>();

//Controllers for every fields to return values
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cpasswordController = TextEditingController();

  var name, email, password, cpassword;
  bool _obscureText  =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.black,
        title: Text(
          "Sign up",
          style: GoogleFonts.notoSerifLao(),
        ),
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
      ),
      body: ListView(children: [
        Form(
          //elevation: 50,
          child: Form(
            key: _singUpFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      makeInputName(label: "Full name"),
                      makeInputEmail(label: "Email"),
                      makeInputPassword(label: "Password", obsureText: true),
                      makeInputCpassword(
                          label: "Confirm Pasword", obsureText: true)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black))),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () async {
                        if (_singUpFormKey.currentState!.validate()) {
                          User?user=await FireAuth.registerUsingEmailPassword(name: nameController.text,
                              email: emailController.text, password:cpasswordController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => home_page(),
                              ));
                        }
                      },
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginDemo(),
                            ));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ]),
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
          height: 40,
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
          height: 40,
        )
      ],
    );
  }


// TextFormField for password

  Widget makeInputPassword({label, obsureText = false}) {
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
          controller: passwordController,
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "Field is empty";
            }
            if (!RegExp(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,10}$')
                .hasMatch(value)) {
              return "Uppercase, lowercase, numbers";
            } else {
              return null;
            }
          },
          obscureText: _obscureText,
          maxLength: 10,
          decoration:  InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                semanticLabel:
                _obscureText ? 'show password' : 'hide password',
              ),
            ),

            hintText: "Enter a strong password",
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

// TextFormField for confirm password

  Widget makeInputCpassword({label, obsureText = false}) {
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
          controller: cpasswordController,
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "Field is empty";
            }

            if (passwordController.text != cpasswordController.text) {
              return "Password must be same";
            } else {
              return null;
            }
          },
          obscureText: obsureText,
          maxLength: 10,
          decoration: const InputDecoration(
            hintText: "Confirm your password",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
