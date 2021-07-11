import 'package:get/get.dart';

import 'menu_logic.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuLogic());
  }
}
