import 'package:event_listing/app/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Container(
        child: (controller.mbIsLogin.value) == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.moUserObj['name'] ?? ""),
                  Text(controller.moUserObj['email'] ?? ""),
                  TextButton(
                      onPressed: () async {
                        await controller.facebookLogout();
                      },
                      child: Text("Logout"))
                ],
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // await controller.facebookLogout();
                    await controller.facebookLogin();
                  },
                  child: Text("Login with facebook"),
                ),
              ),
      ),
    );
  }
}
