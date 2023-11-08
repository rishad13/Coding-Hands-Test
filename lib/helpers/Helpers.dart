import 'package:flutter/material.dart';

class Helpers {
  static navigateTo(BuildContext context, Widget destination) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => destination));
  }

  static Color getColorFromHex(String hexColor) {
    switch (hexColor) {
      case '#FFFFFF':
        return const Color(0xFFFFFFFF);
      case '#5E7360':
        return const Color(0xFF5E7360);
      case '#808080':
        return const Color(0xFF808080);
      case '#4E00AF':
        return const Color(0xFF4E00AF);
      case '#000000':
        return const Color(0xFF000000);
      case '#E6E6E6':
        return const Color(0xFFE6E6E6);
      case '#E8D6FF':
        return const Color(0xFFE8D6FF);
      case '#E0E0E0':
        return const Color(0xFFE0E0E0);
      case '#828282':
        return const Color(0xFF828282);
      case '#EB5757':
        return const Color(0xFFEB5757);

      default:
        return Colors.green;
    }
  }
}
