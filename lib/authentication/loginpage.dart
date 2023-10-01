import 'package:enterpriser_app/constants.dart';
import 'package:enterpriser_app/pages/first.dart';
import 'package:enterpriser_app/widgets/button_for_all.dart';
import 'package:enterpriser_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter, colors: [daak, dak])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    GradientText(
                      "Welcome,back!",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      colors: [pink1, pink2, Colors.pink],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * .6,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [dark, dark4]),
                    borderRadius: BorderRadius.all(Radius.circular(60))),
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
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  decoration: const InputDecoration(
                                      hintText: "Email ",
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.pink,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.pinkAccent),
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
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  focusNode: passFocus,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.password,
                                        color: Colors.pinkAccent,
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
                                            color: Colors.pink,
                                          )),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.pinkAccent),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                          child: errorMessage,
                        ),
                        // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                        ButtonWidget(
                            text: "Login",
                            co: Colors.pink,
                            onPressed: () {
                              nav();
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void nav() {
    if (emailtext.text.isNotEmpty) {
      GlobalSnackBar.show(context, "Logging in!", Colors.green);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => TabPage()));
    } else {
      GlobalSnackBar.show(context, "Enter Email and password!", Colors.red);
    }
  }
}
