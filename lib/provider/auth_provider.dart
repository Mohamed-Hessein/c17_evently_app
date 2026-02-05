import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/user_model.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../core/firebase_functions.dart';

class AuthProvider  extends ChangeNotifier{
  User? fireaseUser;
  UserModel? userModel;
AuthProvider() {
  fireaseUser = FirebaseAuth.instance.currentUser;
  if(fireaseUser !=null){
    init();
  }
}
  init()async{
   userModel = await  FirebaseFunctions.readUser();
  notifyListeners();
  }
}