import 'dart:developer';
import 'dart:ui';

import 'package:enterpriser_app/pages/Enterprise.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:async';

import '../constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Enterprises = [];
  List copyEnt = [];
  bool isLoad = true;

  void initState() {
    // TODO: implement initState
    super.initState();
    val.forEach((element) {
      Enterprises.add(element);
    });
    copyEnt = Enterprises;
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoad = false;
      });
    });
  }

  bool showsearch = false;
  TextEditingController searchtext = TextEditingController();
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xffDA44bb),
      dark4,
      pink1,
      Color(0xff8921aa),
    ],
  ).createShader(Rect.fromLTWH(0.0, 2.0, 200.0, 70.0));
  final FocusNode _Focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.bottomCenter,
              colors: [
                daak,
                dak,
              ],
              begin: Alignment.topCenter),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: dark,
              leading: IconButton.filled(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(daak)),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.pink,
                  )),
              title: GradientText(
                "Home",
                colors: [pink1, pink2, Colors.pink],
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              elevation: 10,
              shadowColor: dark,
              actions: [
                IconButton(
                  onPressed: () {
                    showsearch = true;
                    setState(() {});
                    log("d" + showsearch.toString());
                  },
                  icon: const Icon(Icons.search, color: Colors.pink),
                )
              ],
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                showsearch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              controller: searchtext,
                              focusNode: _Focus,
                              onChanged: (value) {
                                search(value);
                              },
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Search Enterprise name ",
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.pink,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.deepOrange,
                                  border: Border.all(
                                    width: 1,
                                  )),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              showsearch = false;
                              Enterprises = copyEnt;
                              setState(() {});
                            },
                          ),
                        ],
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                const SizedBox(
                  height: 20,
                ),
                isLoad
                    ? Shimmer.fromColors(
                        child: SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(
                                  Icons.image,
                                  size: 50,
                                ),
                                title: SizedBox(
                                    child: Container(
                                      color: Colors.amber,
                                    ),
                                    height: 23),
                                subtitle: SizedBox(
                                    child: Container(
                                      width: 20,
                                      color: Colors.amber,
                                    ),
                                    height: 5,
                                    width: 20),
                              );
                            },
                          ),
                        ),
                        baseColor: Colors.grey,
                        highlightColor: Colors.teal)
                    : ListView.builder(
                        itemCount: Enterprises.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Map a = Enterprises[index];
                          return Column(children: [
                            SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width * .95,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                                splashColor: Colors.yellow,
                                textColor: Colors.black,
                                iconColor: Colors.black,
                                hoverColor: Colors.yellow,
                                title: Text(
                                  a["Name"].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                    //  color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                subtitle: Text(
                                  "Loc: " +
                                      a["Location"] +
                                      "  Owner: " +
                                      a["Owner"],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: darker,
                                          width: 2,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        pink2, pink1, Colors.purple,
                                        //   Color.fromARGB(255, 2, 173, 102),
                                        // Colors.blue
                                      ])),
                                  child: TextButton.icon(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Enterprise(ent: a)));
                                      },
                                      style: const ButtonStyle(
                                          side: MaterialStatePropertyAll(
                                              BorderSide.none),
                                          iconColor: MaterialStatePropertyAll(
                                              Colors.black)),
                                      icon: const Icon(Icons.arrow_right),
                                      label: const Text(
                                        "View",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(40), // Image radius
                                    child: Image.network(a["img"],
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: darker, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                tileColor: dark,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Enterprise(ent: a)));
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ]);
                        },
                      ),
              ]),
            ))));
  }

  void search(String val) {
    final suggest = Enterprises.where((element) {
      final name = element["Name"].toString().toLowerCase();
      final input = val.toLowerCase();
      return name.contains(input);
    }).toList();
    setState(() {
      Enterprises = suggest;
    });
    log("sugg" + suggest.toString());
  }
}
