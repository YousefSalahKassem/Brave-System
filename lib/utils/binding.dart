import 'package:bravesystem/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../controller/rooms_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RoomsController());
  }

}