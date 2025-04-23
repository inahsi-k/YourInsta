import 'package:flutter/widgets.dart';
import 'package:yourinsta/models/user.dart';
import 'package:yourinsta/resources/authentication.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await Authentication().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
