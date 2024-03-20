import 'dart:typed_data';

class MyUser {

  final String? name;
  final String? email;
  final String? password;
  final Uint8List? pfp;
  final Map<String,dynamic>? favCourse;
  MyUser({ this.name, this.email, this.password, this.pfp,this.favCourse});
}
