import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/widgets/bar_graph.dart'; // Assuming this is your chart widget
import 'package:ms/utils/colors.dart';

class MoodStats extends StatefulWidget {
  @override
  _MoodStats createState() => _MoodStats();
}

class _MoodStats extends State<MoodStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mood Statistics',
              style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Mood Today:',
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: primaryColour,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            BarChartSample7(),
          ],
        ),
      ),
    );
  }
}
