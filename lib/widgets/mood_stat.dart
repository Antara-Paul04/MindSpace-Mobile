import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/widgets/bar_graph.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ms/utils/colors.dart';
import 'package:ms/widgets/sleep_stats.dart';

class MoodStats extends StatefulWidget {
  @override
  _MoodStats createState() => _MoodStats();
}

class _MoodStats extends State<MoodStats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                      style: GoogleFonts.lexend(fontSize: 22, fontWeight: FontWeight.w600),
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
                    TextButton(
                      onPressed: (){
                        print('this month');
                      },
                      child:
                       Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 238, 238),
                          borderRadius: BorderRadius.circular(18)
                        ),
                         child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          child: Row(
                            children: [
                              Text('This Week', style:
                                GoogleFonts.lexend(
                                  fontSize: 12,
                                  color: strokeColour,
                                )
                              ),
                              SizedBox(width:3),
                              Icon(OctIcons.chevron_right, color: strokeColour, size: 17,)
                            ],
                          ),
                       ),
                       ),
                    ),
                     Row(children: [
                      Spacer(),
                      TextButton(
                        onPressed: (){
                          print('object');
                        }, 
                        child: Row(
                          children: [
                            Text('view more', style: GoogleFonts.lexend(
                              color: primaryColour,
                              fontSize: 14,
                            ),),
                            Icon(OctIcons.chevron_right, color: primaryColour, size: 17,)
                          ],
                        ))
                    ],),
                    BarGraph(),
                  ],
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
