import 'package:flutter/material.dart';
import 'colored_point.dart';

class MyCustomPainter extends CustomPainter {

  ColoredPoint cp;
  Color color;
  MyCustomPainter(this.cp, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.transparent;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    Paint paint = Paint();

    paint.color = color;
    paint.strokeWidth = 2;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;



    cp.squares.forEach((key, value) {


      for (int i = 0; i < value.length ; i++){

        Paint paint = value[i].da.areaPaint;
        canvas.drawLine(value[i].da.point , Offset(value[i].da.point.dx + value[i].width, value[i].da.point.dy) , paint);
        canvas.drawLine(value[i].da.point , Offset(value[i].da.point.dx , value[i].height+ value[i].da.point.dy) , paint);

        Offset p1 = Offset(value[i].da.point.dx, value[i].height+ value[i].da.point.dy);
        Offset p2 = Offset(value[i].da.point.dx + value[i].width, value[i].da.point.dy);


        canvas.drawLine(p1 , Offset(p1.dx + value[i].width, p1.dy) , paint);
        canvas.drawLine(p2 , Offset(p2.dx , value[i].height+ p2.dy) , paint);

      }
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}