import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../helpers/Helpers.dart';

class SelectionButtonChipList extends StatelessWidget {
  final Function({required bool isSelected}) onPressed;
  final String text;
  final bool choice;
  const SelectionButtonChipList(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.choice});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(text,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              color: choice
                  ? Helpers.getColorFromHex("#4E00AF")
                  : Helpers.getColorFromHex("#000000"),
              fontSize: 14)),
      selected: choice,
      onSelected: (isSelected) {
        onPressed(isSelected: isSelected);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Helpers.getColorFromHex('#E6E6E6'),
          width: 6.0,
        ),
      ),
      backgroundColor: choice
          ? Helpers.getColorFromHex("#E8D6FF")
          : Helpers.getColorFromHex("#FFFFFF"),
      showCheckmark: false,
      padding: const EdgeInsets.all(6),
    );
  }
}
