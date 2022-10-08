import 'package:fetch_api_provider/services/api_call.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  bool loading = false;

  getUserData() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 4));
    users = await ApiCall().getAllUser();
    loading = false;
    notifyListeners();
  }
}
