import 'dart:typed_data';

class MyUser {
  final String? name;
  final String? email;
  final String? password;
  final Uint8List? pfp;
  MyUser(
      {required this.name,
      required this.email,
      required this.password,
       this.pfp});
}
