import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ms/utils/colors.dart';

class SleepStats extends StatefulWidget {
  @override
  _SleepStats createState() => _SleepStats();
}

class _SleepStats extends State<SleepStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Sleep Statistics',
          style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.only(left:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Poor Sleep',
                style: GoogleFonts.lexend(fontSize: 23, fontWeight: FontWeight.w500, color: primaryColour),
                ),
                SizedBox(height: 5),
                Row(children: [
                  Icon(OctIcons.clock, color: primaryColour,),
                  SizedBox(width: 10),
                  Text('3-4 hours',
                  style: GoogleFonts.lexend(fontSize: 15)),
                ],),
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
                ],)
              ],
            )
            )
        ],),
      ),
    );
  }
}
