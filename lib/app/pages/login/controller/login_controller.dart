import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool mbIsLogin = false.obs;
  Map moUserObj = {};

  facebookLogin() async {
    FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']).then((value) {
      FacebookAuth.instance.getUserData().then((value) {
        mbIsLogin.value = true;
        moUserObj = value;
        update();
      });
    });
  }

  facebookLogout() async {
    FacebookAuth.instance.logOut().then((value) {
      mbIsLogin.value = false;
      moUserObj = {};
      update();
    });
  }

  Future<void> login() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      // User successfully logged in
      final accessToken = result.accessToken!.token;
      debugPrint("accessToken $accessToken");
      mbIsLogin.value = true;
      update();
      // You can now use the access token to authenticate the user
      // or retrieve user information from the Facebook Graph API.
    } else {
      // Login failed
      print('Facebook login failed: ${result.message}');
    }
  }

  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
    mbIsLogin.value = false;
    update();
  }
}
