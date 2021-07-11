import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_logic.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final logic = Get.find<VerifyLogic>();

  @override
    Widget build(BuildContext context) {
      return Container();
    }

  @override
  void dispose() {
    Get.delete<VerifyLogic>();
    super.dispose();
  }
}