import 'dart:convert';

import 'package:fetch_api_provider/models/user.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<List<User>> getAllUser() async {
    var res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var list = jsonDecode(res.body) as List;
    List<User> users = list.map((e) => User.fromMap(e)).toList();

    return users;
  }
}
