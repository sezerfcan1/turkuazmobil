import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';
import 'menu_logic.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final logic = Get.find<MenuLogic>();
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
                                  Image.asset('assets/icons/doctor.png'),
                              onPressed: () {
                                Get.toNamed('/ProfilePage',
                                    parameters: {'token': logic.token});
                              },
                            ),
                          ),
                          Text(
                            'Profil',
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
                            'Anketler',
                            style: kBodyText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(bottom: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.4,
                          height: size.height * 0.2,
                          child: IconButton(
                            icon: Image.asset('assets/icons/history.png'),
                            onPressed: () {
                              Get.toNamed('/MyActivityPage',
                                  parameters: {'token': logic.token});
                            },
                          ),
                        ),
                        Text(
                          'Katıldıklarım',
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
                            icon: Image.asset('assets/icons/check.png'),
                            onPressed: () {
                              Get.toNamed('/VerifyPage',
                                  parameters: {'token': logic.token});
                            },
                          ),
                        ),
                        Text(
                          'Onaylama',
                          style: kBodyText,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<MenuLogic>();
    super.dispose();
  }
}
