import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/resources/auth.dart%20';
import 'package:ms/screens/home.dart';
import 'login.dart';
import '../utils/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signupUser(
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text);
    setState(() {
      isLoading = false;
    });
    if (res != 'success') {
      // print(res);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
      return;
    }
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen(userName: userNameController.text)));
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
                  'Create account',
                  style: GoogleFonts.lexend(fontSize: 40),
                ),

                // Sub-Heading
                Text(
                  'Create a new account',
                  style: GoogleFonts.lexend(
                      fontSize: 16, color: const Color.fromARGB(82, 0, 0, 0)),
                ),
                const SizedBox(height: 40),

                // Username Text-box
                Text('Username', style: GoogleFonts.lexend(fontSize: 20)),
                const SizedBox(height: 4),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(
                        OctIcons.person,
                        size: 30,
                        color: strokeColour,
                      ),
                    ),
                    hintText: 'Username',
                    hintStyle:
                        GoogleFonts.lexend(fontSize: 18, color: strokeColour),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Email text-box
                Text('Email', style: GoogleFonts.lexend(fontSize: 20)),
                const SizedBox(height: 4),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(
                        OctIcons.mail,
                        size: 30,
                        color: strokeColour,
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle:
                        GoogleFonts.lexend(fontSize: 18, color: strokeColour),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Password text-box
                Text('Password', style: GoogleFonts.lexend(fontSize: 20)),
                const SizedBox(height: 4),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(15.0),
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
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Signup Button
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: signUpUser,
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
                              child: Text('Sign up',
                                  style: GoogleFonts.lexend(
                                      fontSize: 25, color: Colors.white)),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.lexend(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.all(0),
                            shadowColor: Colors.transparent),
                        child: Text(
                          'Login',
                          style: GoogleFonts.lexend(
                              color: primaryColour, fontSize: 16),
                        ),
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
