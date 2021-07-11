import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/resources/palette.dart';
import 'menu_logic.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                            IconButton(
                              icon: SvgPicture.asset('assets/icons/doctor.svg',
                                  width: 100),
                              onPressed: () {
                                Get.toNamed('/ProfilePage',parameters: {'token':logic.token});
                              },
                              iconSize: size.width * 0.3 < size.height * 0.3
                                  ? size.width * 0.3
                                  : size.height * 0.3,
                            ),
                            Text(
                              'Profil',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: IconButton(
                                icon: SvgPicture.asset('assets/icons/checklist.svg',
                                    width: 100),
                                onPressed: () {
                                  {
                                    Get.toNamed('/SurveysPage',parameters: {'token':logic.token});
                                  }
                                },
                                iconSize: size.width * 0.3 < size.height * 0.3
                                    ? size.width * 0.3
                                    : size.height * 0.3,
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
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/data-transfer.svg',
                              width: 100,
                            ),
                            onPressed: () {
                              Get.toNamed('/MyActivityPage',parameters: {'token':logic.token});
                            },
                            iconSize: size.width * 0.3 < size.height * 0.3
                                ? size.width * 0.3
                                : size.height * 0.3,
                          ),
                          Text(
                            'Katıldıklarım',
                            style: kBodyText,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon:
                            SvgPicture.asset('assets/icons/tick.svg', width: 100),
                            onPressed: () {
                              Get.toNamed('/Verify',parameters: {'token':logic.token});
                            },
                            iconSize: size.width * 0.3 < size.height * 0.3
                                ? size.width * 0.3
                                : size.height * 0.3,
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