import 'package:coding_hands/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/Helpers.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  final Function({required int value}) onPressed;
  const CustomBottomNavigationBar({
    super.key,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        backgroundColor: Helpers.getColorFromHex('#FFFFFF'),
        selectedFontSize: 13,
        selectedItemColor: Helpers.getColorFromHex('#5E7360'),
        enableFeedback: true,
        selectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Helpers.getColorFromHex('#808080'),
        ),
        onTap: (value) {
          onPressed(value: value);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Helpers.getColorFromHex('#FFFFFF'),
            tooltip: 'Home',
            activeIcon: SvgPicture.asset(
              homeIcons,
              height: 24,
              width: 24,
            ),
            icon: SvgPicture.asset(
              homeIcons,
              height: 20,
              width: 19,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            tooltip: 'Search',
            activeIcon: SvgPicture.asset(
              searchIcons,
              height: 24,
              width: 24,
            ),
            icon: SvgPicture.asset(
              searchIcons,
              height: 24,
              width: 24,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            tooltip: 'Orders',
            activeIcon: SvgPicture.asset(
              ordersIcons,
              height: 24,
              width: 24,
            ),
            icon: SvgPicture.asset(
              ordersIcons,
              height: 24,
              width: 24,
            ),
            label: 'Orders',
          ),
          const BottomNavigationBarItem(
            tooltip: 'More',
            activeIcon: Icon(Icons.more_vert, size: 24),
            icon: Icon(Icons.more_vert, size: 24),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
