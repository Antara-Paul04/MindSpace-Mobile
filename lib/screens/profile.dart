import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ms/widgets/mood_stat.dart';
import 'package:ms/utils/colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColour,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:IconButton(
                icon: Icon(OctIcons.pencil, color: primaryColour),
                onPressed: () {
                },
              ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            SizedBox(height:20),
            CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/117584718?v=4'),
              radius: 50,
            ),
            SizedBox(height:10),
            Text('Antara Paul', style: GoogleFonts.lexend(color:primaryColour, fontSize: 27, fontWeight: FontWeight.w500)),
            Text('@paulantara69', style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w300)),
            SizedBox(height:20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Analytics', 
                style: GoogleFonts.lexend(fontSize: 27, fontWeight: FontWeight.w500)
              )),
            SizedBox(height:15),
            MoodStats(),
          ],),
        ),
      ),
    );
  }
}

