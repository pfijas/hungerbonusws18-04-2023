import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String  image;

  const CustomCard({Key? key, required this.title, required this.description,required this.price,required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ListView(
        children:[ Card(
          elevation: 5,
          child:Row(
            children: [
              Image(image: NetworkImage(image)),
              Column(
                children: [
                  Text(title),
                  Text(description),
                  Text(price)
                ],
              )
            ],
          )
        ),
      ]
      ),
    );
  }
}


