import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/edit/colored_point.dart';
import 'package:turkuazmobil/models/survey/answerbrought.dart';

import 'my_activity_image_logic.dart';

class MyActivityImagePage extends StatefulWidget {
  @override
  _MyActivityImagePageState createState() => _MyActivityImagePageState();
}

class _MyActivityImagePageState extends State<MyActivityImagePage> {
  final logic = Get.find<MyActivityImageLogic>();

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
              child: buildGestureDetector(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(logic.answerBrought.value
                      .choices[logic.choicesIndex.value].surveyImage.fileName
                      .replaceAll(r"\", '/')),
                  fit: BoxFit.fill,
                ),
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

  buildGestureDetector() {
    return CustomPaint(
      child: GestureDetector(),
      painter: MyCustomPainter(
          boxes: logic
              .answerBrought.value.choices[logic.choicesIndex.value].boxes),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: logic.bottomNavigationBarSelectedItem.value,
      onTap: (index) {
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
        if (index == 1) {
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
              'assets/icons/next-button.png',
              scale: 3.6,
            ),
            label: 'İleri'),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<MyActivityImageLogic>();
    super.dispose();
  }
}

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({@required this.boxes});

  List<Box> boxes;
  ColoredPoint cp = ColoredPoint();
  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Color.fromARGB(0, 0, 0, 0);
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    var offset;
    var areaPaint;

    boxes.forEach((element) {
      offset = Offset(element.startX.toDouble(), element.startY.toDouble());
      areaPaint = Paint()
        ..color =
            Color(int.parse(element.choice.color.replaceAll('#', '0xFF')));
      cp.addSquare(
          0,
          Squares()
            ..height = element.height.toDouble()
            ..width = element.width.toDouble()
            ..da = DrawingArea(point: offset, areaPaint: areaPaint));
    });

    cp.squares.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        Paint paint = value[i].da.areaPaint;
        paint.strokeWidth = 2;
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
