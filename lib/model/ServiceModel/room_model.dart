import 'package:cloud_firestore/cloud_firestore.dart';

class Room{
  String? name,id,image,players,category,rate,description,price;
  List<dynamic>? images;

  Room(
      {this.name,
      this.images,
      this.id,
      this.image,
      this.players,
      this.category,
      this.rate,
      this.description,
      this.price,
      });


  Room.fromMap(DocumentSnapshot data) {
    if (data==null) return;

    id = data["id"];
    images = data["images"];
    name = data["name"];
    image = data["image"];
    players= data['players'];
    category= data['category'];
    rate= data['rate'];
    description= data['description'];
    price= data['price'];
  }

  toJson() {
    return {
      'id': id,
      'players': players,
      'name': name,
      'image': image,
      'category': category,
      'images': images,
      'rate': rate,
      'description': description,
      'price': price,
    };
  }
}
