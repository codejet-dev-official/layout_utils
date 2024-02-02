import 'dart:ui';

import '../data/constants.dart';

class SizeController {


  static Size getSize(double screenWidth){
    if(screenWidth <= Constants.mMaxWidth){
      return Size(screenWidth * 0.05, 90);
    } else if(screenWidth <= Constants.tMaxWidth && screenWidth > Constants.mMaxWidth){
      return Size(screenWidth * 0.09, 100);
    } else {
      return Size(screenWidth * 0.2, 100);
    }
  }
}