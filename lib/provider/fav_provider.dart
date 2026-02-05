

import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/firebase_model.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  List<FirebaseModel> tasks =[];
  getFavTasks (){
  FirebaseFunctions.getFavTasks().listen((e){
  tasks =  e.docs.map((e)=> e.data()).toList();
    notifyListeners();
  });
  }
  isFav(FirebaseModel task)async {
    var data = await FirebaseFunctions.upDate(task);


  }
}