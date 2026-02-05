import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/firebase_model.dart';
import 'package:eventle_c17_mohamed_mohamed_hessin_01552901158_7_to_10_wed_and_mon/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
 static signUp(String email,String name, String passWord, { required Function onError,required Function onSucess}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passWord,

      );
      SetUser(UserModel(id: credential.user!.uid, email: email, name: name));
      onSucess();



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
    }
  }


  static logIn(String email, String passWord, { required Function onError,required Function onSuces})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: passWord
      );
      onSuces();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      }
    }
  }
  static CollectionReference<FirebaseModel> createClollection(){
   return FirebaseFirestore.instance
    .collection('Tasks').withConverter(fromFirestore: (snapshot, _){
      return FirebaseModel.fromJson(snapshot.data()!);
    }, toFirestore: (model, _){
    return  model.tojson();
    });

  }

 static Future<void> createEvent(FirebaseModel event){
   var collection = createClollection();
   var docRef =collection.doc();
   event.id =docRef.id;
 return  docRef.set(event);
 }
static Future<QuerySnapshot<FirebaseModel>>getEvents({String? catgory} )async{
  var collection = createClollection();
  QuerySnapshot<FirebaseModel> data;
if(catgory != null){
  data = await  collection.where('catgory',isEqualTo:catgory ).get();
} else {
  data = await collection.get();
}

   return data;
}
 static Stream<QuerySnapshot<FirebaseModel>> getStream({String? catg}){ var data;

   if(catg!= null){
     data  = createClollection().where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('catgory',isEqualTo: catg).snapshots();
   }else{
     data  = createClollection().where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
   }

   return data;
}
 static upDate(FirebaseModel task){
   var collec = createClollection();
   var ref =collec.doc(task.id);
   ref.update(task.tojson());

}
 static deleteTask(FirebaseModel task){
   var collec = createClollection();
   var ref =collec.doc(task.id);
   ref.delete();


 }
 static edit(FirebaseModel task){
   var collec = createClollection();
   var ref =collec.doc(task.id);
   ref.update(task.tojson());

 }

static Stream<QuerySnapshot<FirebaseModel>>  getFavTasks(){var data;
 data = createClollection().where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('isFav', isEqualTo: true).snapshots();

return data;
 }

 static CollectionReference<UserModel> creatUserClollection(){
   return FirebaseFirestore.instance
       .collection('User').withConverter(fromFirestore: (snapshot, _){
     return UserModel.fromJson(snapshot.data()!);
   }, toFirestore: (model, _){
     return  model.tojson();
   });

 }


 static SetUser(UserModel user){
   var collection = creatUserClollection();
   var docRef = collection.doc(user.id);
   return docRef.set(user);

 }
static Future<UserModel?> readUser()async{

  var collection = creatUserClollection();

  DocumentSnapshot<UserModel> user =await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();

 return user.data();
 }
 static logOut(){
   FirebaseAuth.instance.signOut();
 }
}