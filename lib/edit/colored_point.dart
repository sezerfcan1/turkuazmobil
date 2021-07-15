

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/models/survey/answer.dart';

import 'edit_logic.dart';

class DrawingArea {
  Offset point;
  Paint areaPaint;
  DrawingArea({@required this.point,@required this.areaPaint});
}

class Squares{
  DrawingArea da;
  double width;
  double height;
}



class ColoredPoint {
  Map<int, List<Squares>> squares = Map();
  double normalizationCoefficient = 1000000.0;
  addSquare(int choiceID, Squares square) {
    if (!squares.containsKey((choiceID))) {
      squares[choiceID] = <Squares>[];
    }
    squares[choiceID].add(square);
  }

  List<Box> getBoxes() {
    List<Box> boxes = <Box>[];
    var containerContex = Get.find<EditLogic>().size;
    if (squares != null) {
      squares.forEach((key, value) {
        for (int i = 0; i < value.length; i++) {//NORMALİZASYON
          Box box = Box();
          box.width = ((value[i].width/containerContex.width)*normalizationCoefficient).toInt().abs();
          box.height = ((value[i].height/containerContex.height)*normalizationCoefficient).toInt().abs();

          if (value[i].width > 0 && value[i].height > 0) {
            box.startX = ((value[i].da.point.dx / containerContex.width)*normalizationCoefficient).toInt();
            box.startY = ((value[i].da.point.dy / containerContex.height)*normalizationCoefficient).toInt();
          } else if (value[i].width < 0 && value[i].height > 0) {
            box.startX = (((value[i].da.point.dx - value[i].width)/containerContex.width)*normalizationCoefficient).toInt();
            box.startY = ((value[i].da.point.dy / containerContex.height)*normalizationCoefficient).toInt();
          } else if (value[i].width > 0 && value[i].height < 0) {
            box.startX = ((value[i].da.point.dx / containerContex.width)*normalizationCoefficient).toInt();
            box.startY = (((value[i].da.point.dy - value[i].height)/containerContex.height)*normalizationCoefficient).toInt();
          } else if (value[i].width < 0 && value[i].height < 0) {
            box.startX = (((value[i].da.point.dx - value[i].width)/containerContex.width)*normalizationCoefficient).toInt();
            box.startY = (((value[i].da.point.dy - value[i].height)/containerContex.height)*normalizationCoefficient).toInt();
          }
          box.choiceId = key;
          boxes.add(box);
        }
      });
    }
    return boxes;
  }
}