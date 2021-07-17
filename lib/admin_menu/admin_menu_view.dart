import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';

import 'admin_menu_logic.dart';

class AdminMenuPage extends StatefulWidget {
  @override
  _AdminMenuPageState createState() => _AdminMenuPageState();
}

class _AdminMenuPageState extends State<AdminMenuPage> {
  final logic = Get.find<AdminMenuLogic>();

  @override
    Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
      return Stack(
        children: [
          BackgroundImage(),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: size.width * 0.4,
                              height: size.height * 0.2,
                              child: IconButton(
                                icon:
                                Image.asset('assets/icons/videocall.png'),
                                onPressed: () {
                                  Get.toNamed('/VideoCallPage',
                                      parameters: {'token': logic.token});
                                },
                              ),
                            ),
                            Text(
                              'Görüntülü Arama',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: size.width * 0.4,
                              height: size.height * 0.2,
                              child: IconButton(
                                icon: Image.asset('assets/icons/online-test.png'),
                                onPressed: () {
                                  {
                                    Get.toNamed('/SurveysPage',
                                        parameters: {'token': logic.token});
                                  }
                                },
                              ),
                            ),
                            Text(
                              'Anket Oluştur',
                              style: kBodyText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(bottom: 10),
                  ),

                ],
              )),
        ],
      );
    }

  @override
  void dispose() {
    Get.delete<AdminMenuLogic>();
    super.dispose();
  }
}