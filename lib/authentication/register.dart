import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../widgets/button_for_all.dart';
import '../widgets/snackbar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailtext = TextEditingController();
  TextEditingController passwordtext = TextEditingController();
  String errormsg = "";
  final FocusNode _emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  void onChange() {
    setState(() {
      errormsg = '';
    });
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    emailtext.addListener(onChange);
    passwordtext.addListener(onChange);

    final errorMessage = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$errormsg',
        style: const TextStyle(fontSize: 14.0, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange,
          Colors.orangeAccent,
          Colors.deepOrangeAccent
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email.';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  controller: emailtext,
                                  focusNode: _emailFocus,
                                  decoration: const InputDecoration(
                                      hintText: "Email ",
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextFormField(
                                  obscureText: _isObscure,
                                  controller: passwordtext,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (v) {
                                    //FocusScope.of(context).requestFocus(node);
                                  },
                                  focusNode: passFocus,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.password,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black,
                                          )),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 10,
                          child: errorMessage,
                        ),
                        // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                        ButtonWidget(
                            text: "Register",
                            co: Colors.deepPurple,
                            onPressed: () {
                              nav();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void nav() {
    GlobalSnackBar.show(context, "Logging in!", Colors.green);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }
}
