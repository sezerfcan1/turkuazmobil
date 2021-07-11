import 'package:get/get.dart';

import 'my_activity_images_logic.dart';

class MyActivityImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyActivityImagesLogic());
  }
}
