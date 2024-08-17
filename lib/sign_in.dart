import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence_example/home_screen.dart';
import 'package:shared_prefrence_example/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var gmailText2 = TextEditingController();
  var passwordText2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                    'Hello \nSign in!',
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: TextField(
                      controller: gmailText2,
                      decoration: InputDecoration(
                          hintText: 'Your Gmail ',
                          labelText: "Gmail ",
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF7d0407),
                          ),
                          //border: InputBorder.none
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.done))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    child: TextField(
                      controller: passwordText2,
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
                              icon: const Icon(Icons.remove_red_eye))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var gmail2 = gmailText2.text.toString();
                      var password2 = passwordText2.text.toString();

                      var prefs = await SharedPreferences.getInstance();

                      prefs.setString("gmail2", gmail2);
                      prefs.setString("password2", password2);

                      var getgmail = prefs.getString('gmail');
                      var getpassword = prefs.getString('password');

                      var getgmail2 = prefs.getString('gmail2');
                      var getpassword2 = prefs.getString('password2');

                      if (getgmail == getgmail2 &&
                          getpassword == getpassword2) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Incorrect password or gmail',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                      }
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
                    height: screenHeight * 0.23,
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
                            builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "Sign Up",
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
    );
  }
}
