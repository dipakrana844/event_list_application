import 'dart:async';

import 'package:event_listing/app/pages/event_list/model/event_list_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailController extends GetxController {
  late Item moItem;
  RxBool mbIsData = false.obs;
  late GoogleMapController myController;
  final Completer<GoogleMapController> moCompleter = Completer();

  List<Marker> moMarker = [];
  @override
  void onInit() {
    debugPrint("Get.arguments -> ${Get.arguments}");
    moItem = Item.fromJson(Get.arguments);
    mbIsData.value = true;
    moMarker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(moItem.venue!.latitude!, moItem.venue!.longitude!),
    ));

    super.onInit();
  }

  void onMapCreated(GoogleMapController controller) {
    myController = controller;
  }
}
