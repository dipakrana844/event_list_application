import 'package:event_listing/app/common/strings.dart';
import 'package:event_listing/app/pages/home/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  // final homeContr = Get.put(HomeController());
  // final homeController = Get .put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          Strings.msHome,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
                padding: EdgeInsets.only(right: 15), child: Icon(Icons.logout)),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 100, right: 40, left: 40, bottom: 50),
              decoration: BoxDecoration(color: Colors.red.shade100),
              width: double.infinity,
              child: Lottie.asset("assets/event.json"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.red,
              child: const Text(
                'Schedule an event?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () => {controller.openBottomSheet()},
                  elevation: 0,
                  highlightElevation: 0,
                  minWidth: double.infinity,
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    Strings.msSelectBtn,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
