class FirebaseModel {
  String id;
  String catgory;
  String title;
  String desc;
  bool isFav =false;
  int date;
  String idUser;
  FirebaseModel({  required this.idUser,required this.catgory, this.isFav =false,required this.title,required this.date, required this.desc, this.id ='', });

   FirebaseModel.fromJson(Map<String, dynamic> json) :this(idUser: json['uid'] ,catgory:  json['catgory'],title: json['title'], date: json['date'], desc: json['desc'],id: json['id'], isFav: json['isFav']);


  Map<String,dynamic> tojson(){

    return {
    'title': title, 'date': date, 'desc': desc,'id': id, 'isFav': isFav,
      'catgory': catgory,
      'uid': idUser
    };
  }

}