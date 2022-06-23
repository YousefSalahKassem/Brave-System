import 'package:rxdart/rxdart.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class SpinnerController extends GetxController{
  final selected = BehaviorSubject<int>();
  int offer =0;
  List<String> offers=["10%","20%","30%","40%","50%","60%","70%","80%"];
  bool flag= false;

  @override
  void onClose() {
    // TODO: implement onClose
    selected.onCancel;
    super.onClose();
  }

  void startGame(){
    selected.add(Fortune.randomInt(0, offers.length),);
    update();
  }

  void result(){
    offer=selected.value;
    update();
  }
}