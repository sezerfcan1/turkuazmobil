import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/edit/colored_point.dart';
import 'package:turkuazmobil/images/images_logic.dart';
import 'custom_painter.dart';
import 'edit_logic.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final logic = Get.find<EditLogic>();
  final imagesLogic = Get.find<ImagesLogic>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return InteractiveViewer(
          scaleEnabled: true,
          maxScale: 20,
          minScale: 0.5,
          child: Container(
            key: logic.stickyKey,
            child: buildGestureDetector(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagesLogic.survey.value
                    .images[imagesLogic.selectedImageIndex.value].fileName
                    .replaceAll(r"\", '/')),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        return buildBottomNavigationBar();
      }),
    );
  }

  buildGestureDetector() {
    if (!logic.zoomable.value) {
      return CustomPaint(
        child: GestureDetector(
          onPanDown: (details) {
            setState(() {
              imagesLogic
                  .survey.value.images[imagesLogic.selectedImageIndex.value].cp
                  .addSquare(
                logic.selectedChoiceId.value,
                Squares()
                  ..da = DrawingArea(
                      point: details.localPosition,
                      areaPaint: Paint()
                        ..strokeCap = StrokeCap.round
                        ..isAntiAlias = true
                        ..color = logic.color.value
                        ..strokeWidth = 2)
                  ..height = 0
                  ..width = 0,
              );
            });
          },
          onPanUpdate: (details) {
            setState(() {
              imagesLogic
                      .survey
                      .value
                      .images[imagesLogic.selectedImageIndex.value]
                      .cp
                      .squares[logic.selectedChoiceId.value]
                      .last
                      .width =
                  details.localPosition.dx -
                      imagesLogic
                          .survey
                          .value
                          .images[imagesLogic.selectedImageIndex.value]
                          .cp
                          .squares[logic.selectedChoiceId.value]
                          .last
                          .da
                          .point
                          .dx;
              imagesLogic
                      .survey
                      .value
                      .images[imagesLogic.selectedImageIndex.value]
                      .cp
                      .squares[logic.selectedChoiceId.value]
                      .last
                      .height =
                  details.localPosition.dy -
                      imagesLogic
                          .survey
                          .value
                          .images[imagesLogic.selectedImageIndex.value]
                          .cp
                          .squares[logic.selectedChoiceId.value]
                          .last
                          .da
                          .point
                          .dy;
            });
          },
        ),
        painter: MyCustomPainter(
            imagesLogic
                .survey.value.images[imagesLogic.selectedImageIndex.value].cp,
            logic.color.value),
      );
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: logic.bottomNavigationBarSelectedItem.value,
      onTap: (index) {
        if (index == 0) {
          if (imagesLogic.selectedImageIndex.value > 0) {
            imagesLogic.selectedImageIndex.value--;
            logic.bottomNavigationBarSelectedItem.value = index;
          } else {
            Get.snackbar('İlk Görüntüdesiniz', 'Daha fazla geri gidemezsiniz',
                snackPosition: SnackPosition.TOP,
                duration: Duration(milliseconds: 750));
          }
        }
        if (index == 1) {
          logic.zoomable.value = false;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ListView.builder(
                dragStartBehavior: DragStartBehavior.down,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  return Card(
                    borderOnForeground: true,
                    elevation: 100,
                    shadowColor: Colors.grey,
                    color: Color(0x9A74E3DF),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                          leading: Container(
                            width: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 3.0),
                              shape: BoxShape.circle,
                              color: imagesLogic
                                  .survey.value.choiceGroup.choices[i]
                                  .getColor(),
                            ),
                          ),
                          title: Text(
                            imagesLogic
                                .survey.value.choiceGroup.choices[i].name,
                            style: TextStyle(fontSize: 17),
                          ),
                          onTap: () {
                            setState(() {
                              logic.bottomNavigationBarSelectedItem.value = 3;
                              logic.color.value = imagesLogic
                                  .survey.value.choiceGroup.choices[i]
                                  .getColor();
                              logic.selectedChoiceId.value = imagesLogic
                                  .survey.value.choiceGroup.choices[i].id;
                              Get.back();
                            });
                          }),
                    ),
                  );
                },
                itemCount:
                    imagesLogic.survey.value.choiceGroup.choices.length - 1,
              );
            },
          );

          Get.snackbar('Çizim modu açık!', 'Yakınlaştırma modu kapalı!',
              duration: Duration(milliseconds: 700),
              snackPosition: SnackPosition.BOTTOM);
        }
        if (index == 2) {
          logic.zoomable.value = true;
          logic.bottomNavigationBarSelectedItem.value = index;
          Get.snackbar('Yakınlaştırma modu açık', '',
              snackPosition: SnackPosition.TOP,
              duration: Duration(milliseconds: 700));
        }
        if (index == 3) {
          logic.bottomNavigationBarSelectedItem.value = index;
          imagesLogic.survey.value.images[imagesLogic.selectedImageIndex.value]
              .cp.squares[logic.selectedChoiceId]
              .removeLast();
        }
        if (index == 4) {
          logic.bottomNavigationBarSelectedItem.value = index;
          logic.sendAnswers(imagesLogic);
        }
        if (index == 5) {
          logic.bottomNavigationBarSelectedItem.value = index;
          imagesLogic.survey.value.images[imagesLogic.selectedImageIndex.value]
              .cp.squares
              .clear();
        }
        if (index == 6) {
          if (imagesLogic.selectedImageIndex.value <
              imagesLogic.survey.value.images.length - 1) {
            imagesLogic.selectedImageIndex.value++;
            logic.bottomNavigationBarSelectedItem.value = index;
          } else {
            Get.snackbar(
                'Sonuncu Görüntüdesiniz', 'Daha fazla ileri gidemezsiniz',
                snackPosition: SnackPosition.TOP,
                duration: Duration(milliseconds: 750));
          }
        }
      },
      iconSize: 10,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/previous.png',
              scale: 3.6,
            ),
            label: 'Geri'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/pencil.png',
              scale: 4.4,
            ),
            label: 'Çizim'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/search.png',
              scale: 2,
            ),
            label: 'Yaklaştır'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/undo.png',
              scale: 3.6,
            ),
            label: 'Geri al'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/send-mail.png',
              scale: 3.8,
            ),
            label: 'Gönder'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/cancel.png',
              scale: 3.6,
            ),
            label: 'Sil'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/next-button.png',
              scale: 3.6,
            ),
            label: 'İleri'),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<EditLogic>();
    super.dispose();
  }
}
