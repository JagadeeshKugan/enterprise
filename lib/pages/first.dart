import 'package:enterpriser_app/constants.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'home.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int pageindex = 0;
  final pages = [
    const Home(),
    const Dashboard(url: "", email: "jjj@gmail.com", Own_enterp: {}),
    const Dashboard(url: "", email: "jjj@gmail.com", Own_enterp: {}),
    const Dashboard(
        url:
            "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        email: "jjj@gmail.com",
        Own_enterp: {
          "img1":
              "https://images.unsplash.com/photo-1470075801209-17f9ec0cada6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
          "Location": "Chennai,Tamilnadu",
          "experience": "10",
          "desc": "years",
        }),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daak,
      appBar: AppBar(
        backgroundColor: dak,
        elevation: 10,
        leading: IconButton.filled(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: Colors.amber,
            )),
      ),
      body: pages[pageindex],
      bottomNavigationBar: bottomnav(context),
    );
  }

  Widget bottomnav(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: daak,
        border: Border(top: BorderSide(color: Colors.yellow, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageindex = 0;
              });
            },
            icon: pageindex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.yellow,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.yellow,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageindex = 1;
              });
            },
            icon: pageindex == 1
                ? const Icon(
                    Icons.work_rounded,
                    color: Colors.yellow,
                    size: 35,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.yellow,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageindex = 2;
              });
            },
            icon: pageindex == 2
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.yellow,
                    size: 35,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.yellow,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageindex = 3;
              });
            },
            icon: pageindex == 3
                ? const Icon(
                    Icons.person_2_sharp,
                    color: Colors.yellow,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.yellow,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
