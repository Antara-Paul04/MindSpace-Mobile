import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodTracker extends StatefulWidget {
  @override
  _MoodTracker createState() => _MoodTracker();
}

class _MoodTracker extends State<MoodTracker> {
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
                    )
                  ]
                ),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: 
                Column(
                  children: [
                    Text('How is your mood today?', style:GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w500,)),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/Angry.png'),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/Sad.png'),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/Neutral.png'),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/Happy.png'),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/Estatic.png'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),                
              );
  }
}

