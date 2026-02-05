class UserModel {

  String id;
  String name;
  String email;
  UserModel({required this.id ,required this.email, required this.name});
  UserModel.fromJson(Map<String, dynamic> json) :this(
    id: json['id'],
    name: json['name'],
    email: json['email'],
  );
  Map<String,dynamic> tojson(){

    return {
   'id':id,
      'name': name,
      'email':email,
    };
  }


}