import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/edit/colored_point.dart';
import 'package:turkuazmobil/models/survey/answerbrought.dart';

import 'verify_image_logic.dart';

class VerifyImagePage extends StatefulWidget {
  @override
  _VerifyImagePageState createState() => _VerifyImagePageState();
}

class _VerifyImagePageState extends State<VerifyImagePage> {
  final logic = Get.find<VerifyImageLogic>();

  double minDistance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (logic.loading.value) {
          return CircularProgressIndicator();
        } else {
          return InteractiveViewer(
            scaleEnabled: true,
            maxScale: 20,
            minScale: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(logic.answerBrought.value
                      .choices[logic.choicesIndex.value].surveyImage.fileName
                      .replaceAll(r"\", '/')),
                  fit: BoxFit.fill,
                ),
              ),
              child: CustomPaint(
                child: GestureDetector(
                  onLongPressEnd: (details) {
                    setState(() {
                      logic.minDistanceIndex = -1;
                      var element = Box();
                      minDistance = (logic.answerBrought.value.choices[logic.choicesIndex.value].boxes[0].height*logic.answerBrought.value.choices[logic.choicesIndex.value].boxes[0].width).toDouble();
                      for (int index = 0;
                      index <
                          logic.answerBrought.value
                              .choices[logic.choicesIndex.value].boxes.length;
                      index++) {
                        element = logic.answerBrought.value
                            .choices[logic.choicesIndex.value].boxes[index];
                        if (details.localPosition.dx >=
                            (element.startX * logic.size.width).toDouble() / 1000000.0 &&
                            details.localPosition.dx <=
                                (element.startX * logic.size.width).toDouble() / 1000000.0 +
                                    (element.width * logic.size.width).toDouble() / 1000000.0) {
                          if (details.localPosition.dy >=
                              (element.startY * logic.size.height).toDouble() / 1000000.0 &&
                              details.localPosition.dy <=
                                  (element.startY * logic.size.height).toDouble() / 1000000.0 +
                                      (element.height * logic.size.height).toDouble() / 1000000.0) {
                            if(element.height*element.height<minDistance){
                              minDistance = (element.height*element.height).toDouble();
                              logic.minDistanceIndex = index;
                            }
                          }
                        }
                      }
                      print(logic.minDistanceIndex);
                    });
                  },
                ),
                painter: MyCustomPainter(
                    boxes: logic.answerBrought.value
                        .choices[logic.choicesIndex.value].boxes),
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: Obx(() {
        return buildBottomNavigationBar();
      }),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: logic.bottomNavigationBarSelectedItem.value,
      onTap: (index) async {
        if (index == 0) {
          if (logic.choicesIndex.value > 0) {
            logic.choicesIndex.value--;
            logic.bottomNavigationBarSelectedItem.value = index;
          } else {
            Get.snackbar('İlk Görüntüdesiniz', 'Daha fazla geri gidemezsiniz',
                snackPosition: SnackPosition.TOP,
                duration: Duration(milliseconds: 750));
          }
        }
        if(index == 1){
          await logic.getSurveyData();

          if(logic.minDistanceIndex!=-1){
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
                                color: logic.survey.value.choiceGroup.choices[i]
                                    .getColor(),
                              ),
                            ),
                            title: Text(
                              logic.survey.value.choiceGroup.choices[i].name,
                              style: TextStyle(fontSize: 17),
                            ),
                            onTap: () {
                              setState(() {
                                logic.bottomNavigationBarSelectedItem.value = 1;
                                logic.answerBrought.value.choices[logic.choicesIndex.value].boxes[logic.minDistanceIndex].choice.color = logic.survey.value.choiceGroup.choices[i].color;
                                logic.selectedChoiceId.value = logic.survey.value.choiceGroup.choices[i].id;
                                Get.back();
                              });
                            }),
                      ),
                    );
                  },
                  itemCount:
                  logic.survey.value.choiceGroup.choices.length - 1,
                );
              },
            );
          }
        }
        if (index == 2) {
          logic.sendData();
        }

        if (index == 3) {
          if (logic.choicesIndex.value <
              logic.answerBrought.value.choices.length - 1) {
            logic.choicesIndex.value++;
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
              scale: 3.6,
            ),
            label: 'Değiştir'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/send-mail.png',
              scale: 3.6,
            ),
            label: 'Gönder'),
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
    Get.delete<VerifyImageLogic>();
    super.dispose();
  }
}

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({@required this.boxes,
  });
  double normalizationCoefficient = 1000000.0;
  final logic = Get.find<VerifyImageLogic>();
  List<Box> boxes;

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Color.fromARGB(0, 0, 0, 0);
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    Get.find<VerifyImageLogic>().size = size;
    var offset;
    var areaPaint;

      for(int index = 0; index< boxes.length ; index++){
        offset = Offset(
            (boxes[index].startX.toDouble() / normalizationCoefficient) * size.width,
            (boxes[index].startY.toDouble() / normalizationCoefficient) * size.height);
        areaPaint = Paint()
        ..strokeWidth = logic.minDistanceIndex != index ? 2 : 4
          ..color =
          Color(int.parse(boxes[index].choice.color.replaceAll('#', '0xFF')));
        logic.cp.value.addSquare(
            0,
            Squares()
              ..height = (boxes[index].height.toDouble() * size.height) /
                  normalizationCoefficient
              ..width = (boxes[index].width.toDouble() * size.width) /
                  normalizationCoefficient
              ..da = DrawingArea(point: offset, areaPaint: areaPaint));

      }


    logic.cp.value.squares.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        Paint paint = value[i].da.areaPaint;
        canvas.drawLine(
            value[i].da.point,
            Offset(value[i].da.point.dx + value[i].width, value[i].da.point.dy),
            paint);
        canvas.drawLine(
            value[i].da.point,
            Offset(
                value[i].da.point.dx, value[i].height + value[i].da.point.dy),
            paint);

        Offset p1 = Offset(
            value[i].da.point.dx, value[i].height + value[i].da.point.dy);
        Offset p2 =
        Offset(value[i].da.point.dx + value[i].width, value[i].da.point.dy);

        canvas.drawLine(p1, Offset(p1.dx + value[i].width, p1.dy), paint);
        canvas.drawLine(p2, Offset(p2.dx, value[i].height + p2.dy), paint);
      }
    });
    logic.cp.value.squares.clear();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
