import 'package:get/get.dart';

class RoomsController extends GetxController{
  var roomIndex=0;
  RxList <String> images = ['assets/images/room1.jpg','assets/images/room2.jpg','assets/images/room3.jpg','assets/images/room4.jpg','assets/images/room5.jpg'].obs;

  void changeTabIndex(int index){
    roomIndex=index;
    update();
  }
}