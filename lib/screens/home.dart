import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ms/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColour,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                BoxIcons.bx_grid_vertical,
                color: primaryColour,
                size: 35,
              )),
          const Spacer(),
          CircleAvatar(
            radius: 26,
            backgroundColor: strokeColour,
            child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_rounded,
                            color: primaryColour, size: 30,)),
            ),
          ),
        ],
        backgroundColor: bgColour,
      ),
    );
  }
}
