import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  void login() {
    //login
  }
  void register() {
    //register
  }

  void signout() {
    //sign out
  }

  String url = 'http://192.168.51.106:8000';
  String end = "/predict";

  Future fetchData(Map<String, dynamic> js) async {
    var uri = Uri(scheme: 'http', host: '127.0.0.1', port: 8000, path: end);

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(js),
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      throw Exception('Failed to load DemoAPI');
    }
  }
}
