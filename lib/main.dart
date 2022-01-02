import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  String nameS = '';
  String phoneS = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
          "Register",
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (str) {
                  setState(() {
                    nameS = str;
                  });
                },
                style: const TextStyle(color: Colors.white, fontSize: 20),
                controller: name,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                    hintText: "Enter your Name Here",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (str) {
                  setState(() {
                    phoneS = str;
                  });
                },
                style: const TextStyle(color: Colors.white, fontSize: 20),
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 35,
                    ),
                    hintText: "Enter your Phone Number Here",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ))),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowData(name: nameS, phone: phoneS)));
        },
        label: const Text(
          "Save",
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ShowData extends StatelessWidget {
  final String name;
  final String phone;
  const ShowData({required this.name, required this.phone, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "INFO",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?size=626&ext=jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 3,
            height: 30,
            indent: 100,
            endIndent: 100,
          ),
          FittedBox(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      phone,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
