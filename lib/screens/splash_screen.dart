import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'signup.dart';
import '../utils/colors.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  final List<String> quotes=['quote 1', 'quote 2', 'quote 3'];
  late String selectedQuote;

  @override
  void initState() {
    super.initState();

    //Initialise animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);

    //Select a random quote
    selectedQuote = quotes[Random().nextInt(quotes.length)];

    //Navigate to login screen after delay
    _navigateLogin();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _navigateLogin() async {
    await Future.delayed(const Duration(milliseconds: 4500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Signup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/white_logo.png',
                  width: 120,
                ),
                Wrap(
                  children: [
                    Text(
                      'Mind',
                      style: GoogleFonts.lexend(
                        color: primaryColour,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Space',
                      style: GoogleFonts.lexend(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Finding peace of mind, one \nspace at a time',
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                // '\"Mental health is not a destination but a process. It\'s about how you drive, not where you\'re going.\" \n- Noam Shpancer',
                selectedQuote,
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              value: controller.value,
              color: primaryColour,
            ),
          ],
        ),
      ),
    );
  }
}
