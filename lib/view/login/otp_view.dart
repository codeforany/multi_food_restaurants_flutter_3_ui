import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';
import 'package:multi_food_restaurants/view/main_tab/main_tab_view.dart';
import '../../common_widget/round_button.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  TextEditingController txtOTP = TextEditingController();

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
                "Verify your Mobile",
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
                "Enter your OTP code here",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              OtpTextField(
                numberOfFields: 4,
                borderColor: TColor.gray,
                focusedBorderColor: TColor.primary,
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                showFieldAsBox: false,
                borderWidth: 4.0,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here if necessary
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {},
              ),
              SizedBox(
                height: media.width * 0.25,
              ),
              RoundButton(
                title: "Verify Now",
                type: RoundButtonType.primary,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const MainTabView()),
                      (route) => true);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
