import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence_example/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var gmailText = TextEditingController();
  var passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF7d0407),
                Color(0xFF780406),
                Color(0xff5c0406)
              ], stops: [
                0.2,
                0.3,
                0.5
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Create Your \n Account',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Your name',
                            labelText: "Full Name",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF7d0407),
                            ),
                            //border: InputBorder.none
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.done))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextField(
                        controller: gmailText,
                        decoration: InputDecoration(
                            hintText: 'Your Gmail or Phone',
                            labelText: "Gmail or Phone",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF7d0407),
                            ),
                            //border: InputBorder.none
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.done))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Your password',
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF7d0407),
                            ),
                            //border: InputBorder.none
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove_red_eye_sharp))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 50),
                      child: TextField(
                        controller: passwordText,
                        decoration: InputDecoration(
                            hintText: 'Your password',
                            labelText: "Confirm Password",
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF7d0407),
                            ),
                            //border: InputBorder.none
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove_red_eye))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignIn()));

                        var gmail = gmailText.text.toString();
                        var password = passwordText.text.toString();

                        var prefs = await SharedPreferences.getInstance();

                        prefs.setString("gmail", gmail);
                        prefs.setString("password", password);
                      },
                      child: Container(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                            color: const Color(0xFF7d0407),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: const Center(
                            child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 180),
                      child: Text(
                        "Don't have account?",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, left: 250),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignIn()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
