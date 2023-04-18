import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restuarant/Authentication/email_password.dart';
import 'package:restuarant/splash/signup.dart';
import '../Authentication/google_signin.dart';
import 'HomePage.dart';
import 'Profilepage.dart';

class LoginDemo extends StatefulWidget {
  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final _loginFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var email, password;
  bool _obscureText = true;
  bool _isProcessing = false;

  get user => null;
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => home_page()
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,

          title: Text(
            "Login",
            style: GoogleFonts.notoSerifLao(),
          ),
        ),
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                makeInputEmail(label: "Email"),
                                makeInputPassword(
                                  label: "Password",
                                  obsureText: true,
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {

                            },
                            child: const Text(
                              'Forgot Password?',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Container(
                              height: 50,
                        width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(40)),
                              child: MaterialButton(
                                height: 100,
                                onPressed: () async {
                                  _focusEmail.unfocus();
                                  _focusPassword.unfocus();
                                  if (_loginFormKey.currentState!.validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });
                                    User? user =
                                        await FireAuth.signInUsingEmailPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //       content: Text('Login Success')),
                                    // );
                                    setState(() {
                                      _isProcessing = false;
                                    });

                                    if (user != null) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return home_page();
                                        },
                                      ));

                                    }
                                  }
                                },
                                color: Colors.deepOrange,
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(20)
                                // ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("--------- or ---------"),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: OutlinedButton(
                                  onPressed: () {
                                    signInWithGoogle().then((value) {
                                      if (value != null) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return home_page();
                                          },
                                        ));
                                      }
                                    });
                                  },
                                   style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                                  child: Text("Sign in with google",style:TextStyle(fontWeight: FontWeight.w500,color: Colors.white),)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30,20,0,0),

                            child: InkWell(
                              child: Center(
                                child: Text(
                                  "No account? Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                              onTap: () => setState(() {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignupPage()));
                              }),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  //Test form field for email

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

//Text form field for password

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
            if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,10}$')
                .hasMatch(value)) {
              return "Uppercase, lowercase, numbers";
            } else {
              return null;
            }
          },
          obscureText: _obscureText,
          maxLength: 10,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                semanticLabel: _obscureText ? 'show password' : 'hide password',
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
}
