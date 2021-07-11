import 'package:get/get.dart';

import 'edit_logic.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditLogic());
  }
}
