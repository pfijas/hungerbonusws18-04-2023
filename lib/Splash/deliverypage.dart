import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'afternoon.dart';
import 'breakfastpage.dart';
import 'dinner.dart';
final List<String> imgList = [
  'https://d4t7t8y8xqo0t.cloudfront.net/resized/1080X400/pages%2F848%2Fimage20190304095247.jpg',
  'https://img.freepik.com/free-psd/food-social-media-banner-post-template_202595-365.jpg?size=626&ext=jpg&ga=GA1.1.1004689847.1678426851&semt=ais',
  'https://img.freepik.com/free-psd/food-social-media-banner-post-template_202595-356.jpg?size=626&ext=jpg&ga=GA1.1.1004689847.1678426851&semt=ais',
  'https://img.freepik.com/free-psd/food-social-media-promotion-instagram-banner-post-design-template_202595-475.jpg?size=626&ext=jpg&ga=GA1.1.1004689847.1678426851&semt=ais',
  'https://img.freepik.com/free-psd/delicous-asian-food-social-media-template_505751-2981.jpg?size=626&ext=jpg&ga=GA1.1.1004689847.1678426851&semt=ais',
  'https://img.freepik.com/premium-psd/delicious-burger-food-menu-social-media-banner-template_106176-335.jpg?size=626&ext=jpg&ga=GA1.1.1004689847.1678426851&semt=ais'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(

  child: Container(
    height: 300,
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(

        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(item, fit: BoxFit.fill ,width: 1200.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),

              ),
            ),
          ],
        )),
  ),
))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Container(
              height: 150,
              width: 400,

              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList
                  .asMap()
                  .entries
                  .map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                //color: Colors.blueGrey,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => breakfast(),));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 150,
                              fit: BoxFit.fill,
                              width: 350,
                              'https://firebasestorage.googleapis.com/v0/b/restaurant-938.appspot.com/o/breakfast%2Fbreakfast.webp?alt=media&token=7ed29b07-d144-469a-b9f4-183b5ebe461a'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Breakfast",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                //color: Colors.blueGrey,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => afternoonpage(),));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 150,
                              fit: BoxFit.fill,
                              width: 350,
                              'https://firebasestorage.googleapis.com/v0/b/restaurant-938.appspot.com/o/breakfast%2Flunch.jpg?alt=media&token=c48d9215-6aff-423d-8312-19aaa5599cfb'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Lunch",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                //color: Colors.blueGrey,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => dinnerpage(),));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 150,
                              fit: BoxFit.fill,
                              width: 350,
                              'https://firebasestorage.googleapis.com/v0/b/restaurant-938.appspot.com/o/breakfast%2FNEFF-Chicken-korma-featured.jpg?alt=media&token=71c26cb2-30db-4261-9b07-ca4b125be8c3'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Dinner",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ]),
    );
  }
}
