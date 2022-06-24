import 'package:get/get.dart';

class CategoryMenuController extends GetxController{
  int currentIndex=0;

  void selectCurrentIndex(int index){
    currentIndex=index;
    update();
  }

}