import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/firebase_model.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/core/firebase_functions.dart';
import 'package:flutter/material.dart';

class ChipsProvider extends ChangeNotifier {

  List<String> images = ['','Sport','Book Club','Birthday','Meeting','Exhibition'];
  List<String> imagesDark = ['','Sport _dark','Book Club_dark','Birthday_dark','Meeting_dark','Exhibition_dark'];

  List<FirebaseModel> tasks = [];
  StreamSubscription<QuerySnapshot<FirebaseModel>>? sub ;

int selectedIndex = 0;
  changeChipsClick(int index){
    selectedIndex  = index ;
getTasksStram();
    notifyListeners();

  }
  bool isClick =false;
getTasksStram() {
    sub?.cancel();

    sub = FirebaseFunctions
        .getStream(catg: selectedIndex == 0 ? null :  images[selectedIndex])
        .listen((snapshot) {
      tasks = snapshot.docs.map((e) => e.data()).toList();
      notifyListeners();
    });
  }
  isFav(FirebaseModel task)async {
    var data = await FirebaseFunctions.upDate(task);
    await getTasksStram();
    notifyListeners();
  }

   getTasks()async{QuerySnapshot<FirebaseModel> data;
if(selectedIndex!=0){ data =  await   FirebaseFunctions.getEvents(catgory: images[selectedIndex] );

}else {
  data =  await   FirebaseFunctions.getEvents();
}

  tasks =data.docs.map((e) => e.data()).toList();
  notifyListeners();
}
  @override
  void dispose(){
    sub?.cancel();
    super.dispose();
  }



}