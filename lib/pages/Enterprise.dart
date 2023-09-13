import 'dart:io';
import 'package:enterpriser_app/widgets/snackbar.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:enterpriser_app/constants.dart';
import 'package:enterpriser_app/pages/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:simple_icons/simple_icons.dart';

class Enterprise extends StatefulWidget {
  final Map ent;
  const Enterprise({required this.ent, super.key});

  @override
  State<Enterprise> createState() => _EnterpriseState();
}

class _EnterpriseState extends State<Enterprise> {
  Map enterp = {};
  final double coverh = 300;
  final double prof = 150;
  void initState() {
    super.initState();
    enterp = widget.ent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: daak,
        appBar: AppBar(
          leading: IconButton.filled(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: dak,
        ),
        body: ListView(
          children: [
            buildtop(),
            const SizedBox(
              height: 10,
            ),
            buildcontent(),
            const SizedBox(
              height: 10,
            ),
            vision(),
            const SizedBox(
              height: 20,
            ),
            buildnet(),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [darker, pink1]),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: darker, width: 3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  buildicons(Icon(Icons.link)),
                  const SizedBox(
                    width: 10,
                  ),
                  buildicons(Icon(SimpleIcons.github)),
                  const SizedBox(
                    width: 10,
                  ),
                  buildicons(Icon(Icons.location_pin)),
                  const SizedBox(
                    width: 10,
                  ),
                  buildicons(Icon(SimpleIcons.facebook)),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            contact(),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Widget product() {
    return Center(
      child: TextButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.pink),
          ),
          onPressed: () {},
          icon: Icon(
            Icons.workspaces,
            color: Colors.white,
          ),
          label: Text(
            "Product",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget contact() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        margin: EdgeInsets.only(left: 40),
        height: 40.0,
        decoration: BoxDecoration(
            border:
                Border.all(color: darker, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              pink2, pink1, Colors.purple,
              // Color.fromARGB(255, 2, 173, 102),
              // Colors.blue
            ])),
        child: IconButton(
          style: const ButtonStyle(
              side: MaterialStatePropertyAll(BorderSide.none),
              iconColor: MaterialStatePropertyAll(Colors.black)),
          onPressed: () async {
            GlobalSnackBar.show(context, "Calling .. ", Colors.blue);

            final Uri launcher = Uri(
              scheme: 'tel',
              path: enterp["phone"],
            );
            await UrlLauncher.launchUrl(launcher);
          },
          icon: const Icon(
            Icons.call,
            color: Colors.yellow,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      product(),
      Container(
        margin: EdgeInsets.only(left: 40),
        height: 40.0,
        decoration: BoxDecoration(
            border:
                Border.all(color: darker, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              pink2, pink1, Colors.purple,
              // Color.fromARGB(255, 2, 173, 102),
              // Colors.blue
            ])),
        child: TextButton.icon(
            style: const ButtonStyle(
                side: MaterialStatePropertyAll(BorderSide.none),
                iconColor: MaterialStatePropertyAll(Colors.black)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(
                        name: enterp["Name"],
                        url: enterp["img"],
                      )));
            },
            icon: const Icon(
              Icons.chat,
              color: Colors.yellow,
            ),
            label: const Text(
              "chat",
              style: TextStyle(color: Colors.yellow),
            )),
      )
    ]);
  }

  Widget buildnet() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: dark,
            border: Border.all(color: darker, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardimg(Icons.money, "Networth", "₹100,00,000", 100),
                  const SizedBox(
                    width: 15,
                  ),
                  cardimg(Icons.money, "Employees", "1000+", 100),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardimg(
                      Icons.history, enterp["experience"], enterp["desc"], 100),
                  const SizedBox(
                    width: 20,
                  ),
                  cardimg(
                      Icons.work, enterp["projects"], enterp["projdesc"], 100)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardimg(
      IconData iconData, String title, String description, double h) {
    return Center(
      child: Container(
        width: 200,
        height: h,
        child: Card(
          color: dak,
          elevation: 5,
          shadowColor: pink1,
          borderOnForeground: true,
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Icon(
                iconData,
                size: 30,
                color: Colors.amber,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              Text(
                description,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.pinkAccent),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget vision() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: dark,
          border: Border.all(color: darker, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Vision :",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      decorationColor: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    enterp["vision"],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decorationColor: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              child: Row(
            children: [
              const Text(
                "Mission :",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                    decorationColor: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  enterp["mission"],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decorationColor: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget buildcontent() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.pink,
                spreadRadius: 2,
                blurRadius: 4,
                blurStyle: BlurStyle.outer),
          ],
          gradient: LinearGradient(colors: [daak, dak, dark4]),
          border: Border.all(color: darker, width: 3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          GradientText(
            enterp["Name"],
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            colors: [pink1, pink2, Colors.pink],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Owned by :" + enterp["Owner"],
            style: const TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(dark)),
                onPressed: () {},
                icon: Icon(Icons.location_pin),
                color: Colors.pink,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                enterp["Location"],
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildicons(Icon icon1) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: daak,
      child: IconButton(
        onPressed: () {},
        color: Colors.pink,
        icon: icon1,
        iconSize: 30,
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
            decoration: BoxDecoration(
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
      backgroundImage: NetworkImage(enterp["img"]),
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
}
