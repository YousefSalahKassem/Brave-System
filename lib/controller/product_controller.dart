import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/ServiceModel/product_model.dart';

class ProductController extends GetxController{
  TextEditingController search= TextEditingController();
  int quantity=1;

  List<ProductModel> products =[
    ProductModel('Cappuccino', '40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/images/latte.png', 'Hot Coffee', '2', true),
    ProductModel('Cappuccino', '40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/images/latte.png', 'Hot Coffee', '2', true),
    ProductModel('Cappuccino', '40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/images/latte.png', 'Hot Coffee', '2', true),
  ];

  List<ProductModel> popularProducts =[
    ProductModel('Frappe', '40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/images/mocha1.png', 'Hot Coffee', '2', true),
  ];

  void addQuantity(){
    quantity++;
    update();
  }

  void deleteQuantity(){
    if(quantity==1){}
    else{
      quantity--;
    }
    update();
  }
}