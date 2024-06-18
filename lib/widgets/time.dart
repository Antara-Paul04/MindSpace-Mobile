import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String message;

    if (now.hour >= 6 && now.hour < 12) {
      message = 'Good Morning,';
    } else if (now.hour >= 12 && now.hour < 18) {
      message = 'Good Afternoon,';
    } else if (now.hour >= 18 && now.hour < 21) {
      message = 'Good Evening,';
    } else {
      message = 'Good Night,';
    }

    return Text(
        message,
        style: GoogleFonts.lexend(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1),
      );
  }
}