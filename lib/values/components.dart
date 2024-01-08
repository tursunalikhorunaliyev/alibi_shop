import 'package:flutter/cupertino.dart';

class ButtonGradients {
  ButtonGradients._();


  static const white = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

}
class BackGroundGradients{
  static const blue = LinearGradient(
    colors: [Color(0xFF3F82E9), Color(0xFF45B1FF), Color(0xFF45B1FF)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );
}
