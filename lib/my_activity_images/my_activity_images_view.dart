import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_activity_images_logic.dart';

class MyActivityImagesPage extends StatefulWidget {
  @override
  _MyActivityImagesPageState createState() => _MyActivityImagesPageState();
}

class _MyActivityImagesPageState extends State<MyActivityImagesPage> {
  final logic = Get.find<MyActivityImagesLogic>();

  @override
    Widget build(BuildContext context) {
      return Container();
    }

  @override
  void dispose() {
    Get.delete<MyActivityImagesLogic>();
    super.dispose();
  }
}