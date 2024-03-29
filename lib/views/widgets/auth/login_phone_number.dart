import 'package:book/logic/controllers/auth_controller.dart';
import 'package:book/routes.dart';
import 'package:book/utils/my_string.dart';
import 'package:book/utils/text_utils.dart';
import 'package:book/utils/theme.dart';
import 'package:book/views/screens/auth/otp_screen.dart';
import 'package:book/views/widgets/auth/auth_button.dart';
import 'package:book/views/widgets/auth/check_widget%20copy.dart';
import 'package:book/views/widgets/auth/check_widget.dart';
import 'package:book/views/widgets/auth/container_under.dart';
import 'package:book/views/widgets/auth/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Login_PhoneNumber_Form extends StatelessWidget {
  Login_PhoneNumber_Form({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: 'Phone number',
                color: labalColor,
                fontWeight: FontWeight.w400,
                fontsize: 11.sp,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          AuthTextFromField(
            controller: phoneController,
            obscureText: false,
            validator: (value) {
              if (!RegExp(validationNumber).hasMatch(value)) {
                return "Worng Phone Number";
              } else {
                return null;
              }
            },
            numCode: "+966 ",
            prefixIcon: Icon(
              Icons.phone_outlined,
              color: labalColor,
            ),
            suffixIcon: const Text(''),
            hintText: "53*******",
          ),
          SizedBox(
            height: 1.76.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: 'Password',
                color: labalColor,
                fontWeight: FontWeight.w400,
                fontsize: 11.sp,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthTextFromField(
              maxLines: 1,
              controller: passwordController,
              obscureText: controller.isVisibilty ? false : true,
              validator: (value) {
                if (value.toString().length < 6) {
                  return " Worng password";
                } else {
                  return null;
                }
              },
              prefixIcon: Icon(
                Icons.lock_outline,
                color: labalColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.Visibilty();
                },
                icon: controller.isVisibilty
                    ? Icon(Icons.visibility_outlined,
                        color: labalColor, size: 20)
                    : Icon(Icons.visibility_off_outlined,
                        color: labalColor, size: 20),
                iconSize: 18,
              ),
              hintText: "Enter your password",
            );
          }),
          SizedBox(
            height: 1.17.h,
          ),
          CheckWidget2(),
          SizedBox(
            height: 3.75.h,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  String phone = phoneController.text;
                  String password = passwordController.text;

                  controller.verifyPhone(phone: phone, password: password);
                  Get.to(OTPScreen(
                    phoneNumber: phoneController.text,
                  ));
                }
              },
              text: "Log In",
            );
          }),
          SizedBox(
            height: 1.17.h,
          ),
          Container_Under(
            text: 'Dont hava an account?',
            typetext: "Sign up",
            onPressed: () {
              Get.offNamed(Routes.signScreen);
            },
          ),
        ],
      ),
    );
  }
}
