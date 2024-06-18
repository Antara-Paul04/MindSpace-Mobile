import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ms/utils/colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: bgColour,
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(OctIcons.pencil, color: primaryColour,)
                      ),
                  ),
                  SizedBox(height:10),
                  Row(
                              children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/117584718?v=4'),
                  ),
                  SizedBox(width:12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Antara Paul', style: TextStyle(fontSize: 23, color: primaryColour, fontWeight: FontWeight.w500),),
                          SizedBox(width:5),
                          Text('(she/her)', style: TextStyle(color:strokeColour))
                        ],
                      ),
                      Text('@paulantara69')
                    ]
                  )
                              ],
                            ),
                ],
              ))
        ],
      ),
    );
  }
}
