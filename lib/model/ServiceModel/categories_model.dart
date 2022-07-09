import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel{
  String? name;
  CategoriesModel({this.name});

  CategoriesModel.fromMap(DocumentSnapshot data) {
    if (data==null) return;
    name = data["name"];

  }

  toJson() {
    return {
      'name': name,
    };
  }
}