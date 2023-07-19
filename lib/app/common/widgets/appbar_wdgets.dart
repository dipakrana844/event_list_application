import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarWidgets extends StatelessWidget {
  final String title;
  const AppbarWidgets({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: false,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
