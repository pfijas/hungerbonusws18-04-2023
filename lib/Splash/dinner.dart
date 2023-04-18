import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class dinnerpage extends StatefulWidget {
  const dinnerpage({Key? key}) : super(key: key);

  @override
  State<dinnerpage> createState() => _dinnerpageState();
}

class _dinnerpageState extends State<dinnerpage> {

  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> description = [];
  List<String> title = [];
  List<String> image = [];
  List<String> price = [];

  Future<void> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL
    var url = "https://restaurant-938-default-rtdb.firebaseio.com/" + "dinner.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        description.add(blogData["description"]);
        title.add(blogData["title"]);
        image.add(blogData["image"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      // throw error;
    }
  }

  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      image: NetworkImage('${image[index]}'),
                      //AppImages.magazinePhoto,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ListTile(
                    trailing:  Text(
                      '${title[index]}',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                        '${description[index]}'
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize:
                          Size(MediaQuery.of(context).size.width, 56)),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
