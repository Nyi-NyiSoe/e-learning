import 'dart:convert';

import 'package:flutter/services.dart';
class LoadJson{
   Future<Map<String,dynamic>> readJson() async{
    final String response = await rootBundle.loadString('assets/category.json');
    final data = await json.decode(response);
   return data;
  }
}