

import 'package:flutter/material.dart';
import 'package:turkuazmobil/models/survey/answer.dart';

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

  addSquare(int choiceID, Squares square) {
    if (!squares.containsKey((choiceID))) {
      squares[choiceID] = <Squares>[];
    }
    squares[choiceID].add(square);
  }

  List<Box> getBoxes() {
    List<Box> boxes = <Box>[];

    if (squares != null) {
      squares.forEach((key, value) {
        for (int i = 0; i < value.length; i++) {
          Box box = Box();
          box.width = value[i].width.toInt().abs();
          box.height = value[i].height.toInt().abs();

          if (value[i].width > 0 && value[i].height > 0) {
            box.startX = value[i].da.point.dx.toInt();
            box.startY = value[i].da.point.dy.toInt();
          } else if (value[i].width < 0 && value[i].height > 0) {
            box.startX = value[i].da.point.dx.toInt() - value[i].width.toInt();
            box.startY = value[i].da.point.dy.toInt();
          } else if (value[i].width > 0 && value[i].height < 0) {
            box.startX = value[i].da.point.dx.toInt();
            box.startY = value[i].da.point.dy.toInt() - value[i].height.toInt();
          } else if (value[i].width < 0 && value[i].height < 0) {
            box.startX = value[i].da.point.dx.toInt() - value[i].width.toInt();
            box.startY = value[i].da.point.dy.toInt() - value[i].height.toInt();
          }
          box.choiceId = key;
          boxes.add(box);
        }
      });
    }
    return boxes;
  }
}