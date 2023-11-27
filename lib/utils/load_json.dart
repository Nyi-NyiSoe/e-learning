import 'dart:convert';
import 'package:edulearn/models/category.dart';
import 'package:flutter/services.dart';

class LoadJson {
  List<CategoryModel> categories = [];
  Future<List<CategoryModel>> readJson() async {
    try {
      // Load JSON data from the assets folder
      final String response =
          await rootBundle.loadString('assets/category.json');

      // Decode the JSON data
      final Map<String, dynamic> jsonData = json.decode(response);
      final List<Map<String, dynamic>> categoriesList =
          List<Map<String, dynamic>>.from(jsonData['categories']);
      // Convert the decoded data into a list of Category instances
      categories =
          categoriesList.map((json) => CategoryModel.fromJson(json)).toList();
        //  for(var res in categories){
        //   //print(res.categoryName);
        //   // res.languages.forEach((key, value) { 
        //   //   print(key+value);
        //   // });
          

        //  }
      return categories;
      
    } catch (error) {
      print('Error reading JSON: $error');
      return [];
    }
  }
}
