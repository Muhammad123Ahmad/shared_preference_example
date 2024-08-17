import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_prefrence_example/sign_in.dart';
import 'package:shared_prefrence_example/sign_up.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSignInTapped = false;
  bool _isSignUpTapped = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Column(
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
                children: [
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                  Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.3,
                    child: Image.asset(
                      'assest/dumbell.png',
                    ),
                  ),
                  const Text(
                    'FITNESS CLUB',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSignInTapped = !_isSignInTapped;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignIn()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Container(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                            color: _isSignInTapped
                                ? Colors.transparent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color:
                                  _isSignInTapped ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSignUpTapped = !_isSignUpTapped;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                          color: _isSignUpTapped
                              ? Colors.transparent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                          child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color:
                                _isSignUpTapped ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 6),
                    child: Text(
                      'Login with Social Media',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 100, right: 100, top: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assest/instagram.png')),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                            backgroundImage: AssetImage('assest/fb.png')),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                            backgroundImage: AssetImage('assest/twitter.png')),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
