import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ms/utils/colors.dart';
import 'package:ms/widgets/main_drawer.dart';
import 'package:ms/widgets/mood_tracker.dart';
import 'package:ms/widgets/time.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: bgColour,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  BoxIcons.bx_grid_vertical,
                  color: primaryColour,
                  size: 35,
                )),
          );
        }),
        actions: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: strokeColour, width: 1)
                ),
                child: Center(
                  child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          color: primaryColour,
                          size: 30,
                        )),
                ),
                ),
          ),
        ],
        backgroundColor: bgColour,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: CustomMessage(),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('$userName!',
                      style: GoogleFonts.lexend(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: primaryColour))),
              SizedBox(height: 20),
              MoodTracker(),
            ],
          ),
        ),
      ),
    );
  }
}
