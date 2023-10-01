import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../constants.dart';

class Dashboard extends StatefulWidget {
  final String url;
  final String email;
  final Map Own_enterp;
  const Dashboard(
      {super.key,
      required this.url,
      required this.email,
      required this.Own_enterp});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map enterp = {};
  String email = "";
  final double coverh = 300;
  final double prof = 150;
  void initState() {
    super.initState();
    enterp = widget.Own_enterp;
    email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daak,
      appBar: AppBar(
        backgroundColor: daak,
        title: GradientText(
          "Dashboard",
          colors: [pink1, pink2, Colors.pink],
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        elevation: 10,
        shadowColor: dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [buildtop(), cover()],
          ),
        ),
      ),
    );
  }

  Widget buildtop() {
    final top = coverh - prof / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            margin: EdgeInsets.only(bottom: prof / 2),
            child: buildcover()),
        Positioned(
          child: buildprofile(),
          top: top,
          left: 30,
        )
      ],
    );
  }

  Widget buildprofile() {
    return CircleAvatar(
      radius: Platform.isAndroid ? prof / 3 : prof / 2,
      backgroundColor: darker,
      backgroundImage: NetworkImage(widget.url),
    );
  }

  Widget buildcover() {
    return Container(
      height: coverh,
      width: double.infinity,
      color: dark,
      child: Image.network(
        enterp["img1"],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget cover() {
    String name = "JAGADEESH";
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Name: ",
                style: TextStyle(color: Colors.yellow, fontSize: 20),
              ),
              Text(
                name,
                style: TextStyle(color: Colors.pink, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "email: ",
                style: TextStyle(color: Colors.yellow, fontSize: 20),
              ),
              Text(
                widget.email,
                style: TextStyle(color: Colors.pink, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text.rich(TextSpan(children: [
            TextSpan(
                text: "Website:  ",
                style: TextStyle(color: Colors.yellow, fontSize: 20)),
            TextSpan(
              text: " https:jdservices.com/ ",
              style: TextStyle(color: Colors.pink, fontSize: 20),
            ),
          ])),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.pink),
              ),
              onPressed: () {},
              icon: Icon(Icons.work),
              label: Text(
                "Your Products",
                style: TextStyle(color: dark, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
