import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';
import 'package:multi_food_restaurants/common/extension.dart';
import 'package:multi_food_restaurants/view/login/forgot_password_view.dart';
import 'package:multi_food_restaurants/view/login/otp_view.dart';
import 'package:multi_food_restaurants/view/login/signup_view.dart';

import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

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
              SizedBox(
                height: media.width * 0.07,
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
                "Sign in to continue",
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
                controller: txtPassword,
                obscureText: true,
                hitText: "Password",
              ),
              SizedBox(
                height: media.width * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordView()));

                      endEditing();
                    },
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              RoundButton(
                title: "Login",
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const OtpView()));
                  endEditing();
                },
                type: RoundButtonType.primary,
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to Capi Restaurant?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpView()));
                      endEditing();
                    },
                    child: Text(
                      "Signup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
