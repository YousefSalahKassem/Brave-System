import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String? name,image;

  CategoryModel({this.name, this.image});

  CategoryModel.fromMap(DocumentSnapshot data) {
    if (data==null) return;


    name = data["name"];
    image = data["image"];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
