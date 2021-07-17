import 'package:get/get.dart';

class AdminMenuLogic extends GetxController {
  var token;
  @override
  void onInit() {
    token = Get.parameters['token'];
    super.onInit();
  }


}
