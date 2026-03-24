import 'package:flutter/cupertino.dart';

double getWidth(double width, BuildContext context) {
  return MediaQuery.sizeOf(context).width * width;
}

double getHeight(double height, BuildContext context) {
  return MediaQuery.sizeOf(context).height * height;
}
