import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restuarant/splash/HomePage.dart';
import 'package:restuarant/splash/loginpage.dart';
import 'package:restuarant/splash/signup.dart';
import 'package:restuarant/splash/splash_1.dart';
import 'Splash/Editprofilepage.dart';
import 'Splash/Profilepage.dart';
import 'Splash/Settingpage.dart';
import 'Splash/breakfastpage.dart';
import 'Splash/afternoon.dart';
import 'Splash/cart.dart';
import 'Splash/foodcard.dart';
import 'Splash/foodsection.dart';
import 'Splash/settings_2.dart';

main()async {
  runApp(Myapp());
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

}
final themeMode = ValueNotifier(2);

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:SplashScreen(),
        );
      },
      valueListenable: themeMode,
    );
  }
}
// class classes extends StatefulWidget {
//   const classes({Key? key}) : super(key: key);

//   @override
//   State<classes> createState() => _classesState();
// }

// class _classesState extends State<classes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 200,
//         width: 100,
//         child: CustomCard(title: "ghgjh",description: "rttyryty",
//         price: "2334",image: "https://img.freepik.com/premium-photo/appam-velliappam-kallappam-paalappam-tasty-delicious-breakfast-item-south-india-with-good-combination-kadala-curry-bengal-gram-curry-placed-white-background_527904-2533.jpg?w=996"),
//       ),
//     );
//   }
// }
