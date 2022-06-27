import 'package:bravesystem/controller/auth_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}