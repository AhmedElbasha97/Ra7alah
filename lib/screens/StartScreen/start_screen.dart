import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ra7alah/screens/loginScreen/login_screen.dart';
import 'package:ra7alah/screens/signupScreen/signup_screen.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/widgets/button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/startLogo.png",height: 400, width: 500,fit: BoxFit.fill,),
        RoundedCornerButton(borderRadius: 25.0,title: "Sign In",hasBorder: true,height: 48,width: 200,backgroundColor: kBackgroundColor,onPressed: (){Get.to(LoginScreen());},textColor: kPrimaryColor,),
        const SizedBox(height: 20,),
        RoundedCornerButton(borderRadius: 25.0,title: "Sign Up",hasBorder: true,height: 48,width: 200,backgroundColor: kPrimaryColor,onPressed: (){Get.to(SignupScreen());},textColor: kBackgroundColor,),

  ],
      ),
    ),
    );
  }
}
