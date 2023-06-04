import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';

import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          width: media.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: TColor.primary,
                  ),
                ),
              ),
              Text(
                "Welcome to\nCapi Restaurant",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.02,
              ),
              Text(
                "Sign up to continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.07,
              ),
              LineTextField(
                controller: txtEmail,
                hitText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: media.width * 0.07,
              ),

              LineTextField(
                controller: txtMobile,
                hitText: "Mobile Number",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: media.width * 0.07,
              ),
              
              LineTextField(
                controller: txtPassword,
                obscureText: true,
                hitText: "Password",
              ),
              SizedBox(
                height: media.width * 0.07,
              ),

               LineTextField(
                controller: txtConfirmPassword,
                obscureText: true,
                hitText: "Confirm Password",
              ),
             
              SizedBox(
                height: media.width * 0.1,
              ),
              RoundButton(
                title: "Signup",
                onPressed: () {},
                type: RoundButtonType.primary,
              ),
             
            ],
          ),
        )),
      ),
    );
  }
}
