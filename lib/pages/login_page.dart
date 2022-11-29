import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/login_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/custom_mouse_region.dart';
import 'package:my_home/core/custom_widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<LoginController>(builder: (logic) {
      return Scaffold(
        body: Row(
          children: [
            Image.asset(
              'assets/png/ic_login.png',
              width: width * 0.5 - 32,
              height: width * 0.5 - 32,
            ),
            SizedBox(
              width: width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: AppConstants.marginAll16,
                    child: Text(
                      'Welcome to Smart Realtor!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomTextField(
                    labelText: 'Username',
                    controller: logic.usernameController,
                    sufficIconData: Icons.person,
                  ),
                  AppConstants.boxHeight16,
                  if (!logic.isLogin)
                    CustomTextField(
                      labelText: 'Email',
                      controller: logic.emailController,
                      sufficIconData: Icons.email,
                    ),
                  if (!logic.isLogin) AppConstants.boxHeight16,
                  if (!logic.isLogin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  if (!logic.isLogin)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: RadioListTile<bool>(
                            title: const Text("Male"),
                            value: true,
                            groupValue: logic.gender,
                            onChanged: logic.switchGender,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                            title: const Text("Female"),
                            value: false,
                            groupValue: logic.gender,
                            onChanged: logic.switchGender,
                          ),
                        )
                      ],
                    ),
                  if (!logic.isLogin) AppConstants.boxHeight4,
                  CustomTextField(
                    labelText: 'Password',
                    controller: logic.passwordController,
                    obscure: logic.obscure,
                    textObscureCallback: logic.switchPasswordObscure,
                  ),
                  Padding(
                    padding: AppConstants.marginVertical16,
                    child: CustomButton(
                      isLoading: logic.isLoading,
                      title: logic.isLogin ? 'Login' : "Sign Up",
                      onPressed: () {
                        if (logic.isLogin) {
                          logic.login();
                        } else {
                          logic.signUp();
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      CustomMouseRegion(
                        mouseRegionListener: logic.loginSwitchButtonListener,
                        onTap: logic.switchLoginMode,
                        child: Text(
                          logic.isLogin
                              ? 'Don\'t have an account?'
                              : 'Already have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            color: logic.loginSwitchButtonColor,
                          ),
                        ),
                      ),
                      const Visibility(
                        visible: false,
                        child: AppConstants.spacer,
                      ),
                      Visibility(
                        visible: false,
                        child: CustomMouseRegion(
                          // mouseRegionListener: logic.forgotPasswordListener,
                          onTap: () {},
                          mouseRegionListener: (_) {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 16,
                              color: logic.forgotPasswordButtonColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
