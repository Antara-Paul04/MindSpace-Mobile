import 'package:flutter/material.dart';
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
              child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/117584718?v=4'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
