import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/background_image.dart';
import 'package:turkuazmobil/surveys/surveys_logic.dart';

import 'images_logic.dart';

class ImagesPage extends StatefulWidget {
  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final logic = Get.find<ImagesLogic>();
  final surveys = Get.find<SurveysLogic>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Obx(() {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/EditPage',parameters: {'token':logic.token , 'surveyId':logic.surveyId});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        surveys
                            .surveysMini[surveys.selectedSurveyIndex.value]
                            .smallImages[logic.selectedImageIndex.value]
                            .fileName
                            .replaceAll(r"\", '/'),
                      ),
                      fit: BoxFit.fill,
                    )),
                  ),
                );
              }),
            ),
          ),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
              currentIndex: logic.currentIndex.value,
              onTap: (index) {
                if (index == 0) {
                  if (0 < logic.selectedImageIndex.value) {
                    logic.selectedImageIndex.value--;
                    logic.currentIndex.value = index;
                  } else {
                    Get.snackbar('İlk Görüntüdesiniz', 'Daha fazla geri gidemezsiniz',snackPosition: SnackPosition.TOP,duration: Duration(milliseconds: 750));
                  }
                }
                if (index == 1) {
                  if (surveys.surveysMini[surveys.selectedSurveyIndex.value]
                              .smallImages.length -
                          1 >
                      logic.selectedImageIndex.value) {
                    logic.selectedImageIndex.value++;
                    logic.currentIndex.value = index;
                  } else {
                    Get.snackbar('Sonuncu Görüntüdesiniz', 'Daha fazla ileri gidemezsiniz',snackPosition: SnackPosition.TOP,duration: Duration(milliseconds: 750));
                  }
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_left), label: 'Önceki görüntü'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_right), label: 'Sonraki görüntü'),
              ],
            );
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<ImagesLogic>();
    super.dispose();
  }
}
