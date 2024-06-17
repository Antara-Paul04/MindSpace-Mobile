import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/resources/auth.dart';
import 'signup.dart';
import '../utils/colors.dart';
import 'home.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async{
    setState(() {
      isLoading=true;
    });
    var res = await AuthMethods().loginUser(
      email: emailController.text, 
      password: passwordController.text
      );
    setState(() {
      isLoading= false;
    });
    if (res[0] !='success'){
      print(res);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res[0])));
      return;
    }
    // var  userName = await _firestore.collection('user').doc(res[1]);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen(userName: res[1])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColour,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Text(
                  'Welcome back!',
                  style: GoogleFonts.lexend(fontSize: 40),
                ),

                // Sub-Heading
                Text(
                  'Login to your account',
                  style: GoogleFonts.lexend(
                      fontSize: 16, color: const Color.fromARGB(82, 0, 0, 0)),
                ),
                SizedBox(height: 40),

                // Username Text-box
                Text('Username / Email',
                    style: GoogleFonts.lexend(fontSize: 20)),
                SizedBox(height: 4),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        OctIcons.person,
                        size: 30,
                        color: strokeColour,
                      ),
                    ),
                    hintText: 'Username / Email',
                    hintStyle:
                        GoogleFonts.lexend(fontSize: 18, color: strokeColour),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Password text-box
                Text('Password', style: GoogleFonts.lexend(fontSize: 20)),
                SizedBox(height: 4),
                TextField(

                  obscureText: true,

                  controller: passwordController,

                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        OctIcons.lock,
                        size: 30,
                        color: strokeColour,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle:
                        GoogleFonts.lexend(fontSize: 18, color: strokeColour),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: loginUser,
                    focusColor: primaryColour,
                    highlightColor: primaryColour,
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: primaryColour,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text('Login',
                                  style: GoogleFonts.lexend(
                                      fontSize: 22, color: Colors.white)),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.lexend(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text(
                          'Signup',
                          style: GoogleFonts.lexend(
                              color: primaryColour, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                            shadowColor: Colors.transparent),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
