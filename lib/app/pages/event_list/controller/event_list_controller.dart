import 'package:dio/dio.dart';
import 'package:event_listing/app/common/strings.dart';
import 'package:event_listing/app/pages/event_list/model/event_list_model.dart';
import 'package:event_listing/app/pages/event_list/screen/event_list_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListController extends GetxController {
  final Dio moDio = Dio();
  ViewType moViewType = ViewType.grid;

  int moCrossAxisCount = 2;
  double moAspectRatio = 1.5;
  String msEventDetailApi = "";
  RxBool mbIsSelectIcon = false.obs;
  RxBool mbEventDataGet = false.obs;
  RxDouble moMainAxisExtent = RxDouble(0);
  RxList<Item> favoriteList = <Item>[].obs;

  late EventListModel moEventDetail;

  @override
  void onInit() {
    msEventDetailApi = Get.arguments[1] ?? "";
    fetchCategories();
    super.onInit();
  }

  void addToFavorite(Item item) {
    favoriteList.add(item);
  }

  void removeFromFavorite(Item item) {
    favoriteList.remove(item);
  }

  void viewSwitching() {
    if (moViewType == ViewType.list) {
      moCrossAxisCount = 2;
      moAspectRatio = 1.5;
      moMainAxisExtent.value = 220;
      moViewType = ViewType.grid;
    } else {
      moCrossAxisCount = 1;
      moAspectRatio = 5;
      moMainAxisExtent.value = 140;
      moViewType = ViewType.list;
    }
    update();
  }

  void toggleSelection() {
    // mbIsSelectIcon.value = !mbIsSelectIcon.value;
    update();
  }

  fetchCategories() async {
    try {
      debugPrint("msEventDetailApi -> $msEventDetailApi");
      final moResponse = await moDio.get("$msEventDetailApi$msTimeStamp");
      debugPrint("response -> ${moResponse.data}");
      if (moResponse.statusCode == 200) {
        if (msEventDetailApi.isNotEmpty) {
          moEventDetail = EventListModel.fromJson(moResponse.data);
          debugPrint("response.data -> ${moResponse.data}");
          mbEventDataGet.value = true;
          update();
        }
      }
    } catch (e) {
      debugPrint('API Error: $e');
    }
  }
}
