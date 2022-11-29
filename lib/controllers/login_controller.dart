import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/data/repository/login_repository.dart';
import 'package:my_home/models/auth/sign_up_response.dart';
import 'package:my_home/models/ui_models/user.dart';
import 'package:my_home/models/user/user_details_response.dart';

class LoginController extends BaseController {
  final LoginRepository _repository = LoginRepository();

  @override
  void onReady() {
    debugPrint('LOGIN CONTROLLER');
    super.onReady();
  }

  bool obscure = true;
  bool isLogin = true;
  bool gender = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color loginSwitchButtonColor = Colors.black.withOpacity(0.8);
  Color forgotPasswordButtonColor = Colors.black.withOpacity(0.8);

  void switchLoginMode() {
    isLogin = !isLogin;
    update();
  }

  void clearTextFields(){
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    isLogin = true;
  }

  void switchPasswordObscure() {
    obscure = !obscure;
    update();
  }

  void switchGender(bool? value) {
    gender = value ?? false;
    debugPrint('Gender: ${gender ? 'Male' : "Female"}');
    update();
  }

  void loginSwitchButtonListener(bool isHover) {
    if (!isHover) {
      loginSwitchButtonColor = Colors.black.withOpacity(0.8);
    } else {
      loginSwitchButtonColor = Colors.deepPurple;
    }
    update();
  }

  ///for future use
  // void forgotPasswordListener(bool isHover) {
  //   if (!isHover) {
  //     forgotPasswordButtonColor = Colors.black.withOpacity(0.8);
  //   } else {
  //     forgotPasswordButtonColor = Colors.deepPurple;
  //   }
  //   update();
  // }

  void login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      List<String> errorMessage = [];
      if (usernameController.text.isEmpty) {
        errorMessage.add('username');
      }
      if (passwordController.text.isEmpty) {
        errorMessage.add('password');
      }
      showErrorSnackBar('Please enter ${errorMessage.join(', ')}');
      return;
    }
    setLoading(true);
    var result = await _repository.login(
        username: usernameController.text, password: passwordController.text);
    if (result is UserDetailsResponse) {
      await localSource.setProfile(
        User(
          email: result.email,
          username: result.username,
          sessionToken: result.sessionToken,
          gender: result.gender,
          isEmailVerified: result.emailVerified,
          isAdmin: result.isAdmin,
        ),
      );
      // _repository.verifyEmail(email: result.email ?? '');
      setLoading(false);
      Get.toNamed(AppRouteNames.MAIN);
      clearTextFields();
      showSuccessSnackBar();
    } else {
      setLoading(false);
      showErrorSnackBar('Wrong Username or Password! :(');
    }
  }

  void signUp() async {
    if (usernameController.text.isEmpty ||
        (passwordController.text.isEmpty ||
            passwordController.text.length < 8) ||
        emailController.text.isEmpty) {
      List<String> errorMessage = [];
      if (usernameController.text.isEmpty) {
        errorMessage.add('username');
      }
      if (emailController.text.isEmpty) {
        errorMessage.add('email');
      }
      if (passwordController.text.isEmpty) {
        errorMessage.add('password');
      }
      if (passwordController.text.length < 8) {
        errorMessage.add('longer password (min. 8 characters)');
      }
      showErrorSnackBar('Please enter ${errorMessage.join(', ')}');
      return;
    }

    setLoading(true);
    var resultOne = await _repository.singUp(
      username: usernameController.text,
      password: passwordController.text,
      email: emailController.text,
      gender: gender,
    );
    if (resultOne is SignUpResponse) {
      if ((resultOne.sessionToken ?? '').isNotEmpty) {
        var result = await _repository.getProfile(
            sessionToken: resultOne.sessionToken ?? '');
        if (result is UserDetailsResponse) {
          await localSource.setProfile(
            User(
              email: result.email,
              username: result.username,
              sessionToken: result.sessionToken,
              gender: result.gender,
              isEmailVerified: result.emailVerified,
              isAdmin: result.isAdmin,
            ),
          );
          setLoading(false);
          Get.toNamed(AppRouteNames.MAIN);
          clearTextFields();
          showSuccessSnackBar(
              message: 'You have successfully signed up in SmartRealtor');

        } else {
          setLoading(false);
          showErrorSnackBar('Something went wrong! :(');
        }
      } else {
        setLoading(false);
        showErrorSnackBar('Something went wrong! :(');
      }
    } else {
      setLoading(false);
      showErrorSnackBar('User with this username already exists :(');
    }
  }
}
