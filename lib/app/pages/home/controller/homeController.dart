import 'package:dio/dio.dart';
import 'package:event_listing/app/common/strings.dart';
import 'package:event_listing/app/pages/home/model/categories_model.dart';
import 'package:event_listing/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Dio moDio = Dio();
  RxList<CategoriesModel> moCategories = RxList<CategoriesModel>([]);
  RxBool mbCategoriesData = false.obs;
  RxInt miSelectedService = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  ///fetch Data
  fetchCategories() async {
    try {
      final moResponse = await moDio
          .get("https://allevents.s3.amazonaws.com/tests/categories.json");
      debugPrint("response -> $moResponse");
      if (moResponse.statusCode == 200) {
        final List<dynamic> moJsonCategories = moResponse.data;
        moCategories.value = moJsonCategories
            .map((data) => CategoriesModel.fromJson(data))
            .toList();
        mbCategoriesData.value = true;
      }
    } catch (e) {
      debugPrint('API Error: $e');
    }
  }

  void openBottomSheet() {
    Get.bottomSheet(
      isDismissible: false,
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: Colors.grey, // Customize the color of the divider
                thickness: 4.0,
                endIndent: Get.width * 0.40,
                indent: Get.width * 0.40,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Categories"),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              mbCategoriesData.value
                  ? GetBuilder<HomeController>(builder: (homeCtr) {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.0,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 30.0,
                            ),
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: moCategories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return categoriesContainer(
                                  moCategories[index].category.toString(),
                                  index);
                            }),
                      );
                    })
                  : const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () {
                    debugPrint("miSelectedService -> ${miSelectedService}");
                    Get.toNamed(AppRoutes.EVENTLIST, arguments: [
                      moCategories[miSelectedService.value].category,
                      moCategories[miSelectedService.value].data
                    ]);
                    // Get.back();
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  minWidth: double.infinity,
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    Strings.msContinueBtn,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  categoriesContainer(String name, int index) {
    return GestureDetector(
      onTap: () {
        if (miSelectedService == index) {
          miSelectedService.value = -1;
        } else {
          miSelectedService.value = index;
        }
        update();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: miSelectedService == index
              ? Colors.amber.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: miSelectedService == index
                ? Colors.amber
                : Colors.blue.withOpacity(0),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: miSelectedService == index
                      ? Colors.amber.shade800
                      : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
