import 'package:event_listing/app/common/widgets/text_widget.dart';
import 'package:event_listing/app/pages/event_detail/controller/event_detail_controller.dart';
import 'package:event_listing/app/pages/event_detail/screens/widgets/top_card_widgets.dart';
import 'package:event_listing/app/pages/event_list/controller/event_list_controller.dart';
import 'package:event_listing/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailPage extends GetView<EventDetailController> {
  EventDetailPage({super.key});
  final eventDetailCtr = Get.find<EventListController>();

  @override
  Widget build(BuildContext context) {
    Get.put(EventDetailController());
    return Scaffold(
      appBar: AppBar(
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
          controller.moItem.eventname.toString(),
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(
                AppRoutes.WebPage,
                arguments: [
                  controller.moItem.eventname.toString(),
                  controller.moItem.eventUrl,
                ],
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.open_in_browser),
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.mbIsData.value
            ? SingleChildScrollView(
                child: Container(
                  color: Colors.grey[200]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopCardWidget(),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: TextWidget(
                          text: "Date & Time",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: TextWidget(
                          text: controller.moItem.startTimeDisplay.toString(),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: TextWidget(
                          text: "Venue",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: TextWidget(
                          text: controller.moItem.venue!.fullAddress.toString(),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: TextWidget(
                          text: "View Map",
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 300,
                          child: GoogleMap(
                            compassEnabled: true,
                            myLocationEnabled: true,
                            onMapCreated: (GoogleMapController mapController) {
                              controller.moCompleter;
                            },
                            markers: Set<Marker>.of(controller.moMarker),
                            initialCameraPosition: CameraPosition(
                              target: LatLng(controller.moItem.venue!.latitude!,
                                  controller.moItem.venue!.longitude!),
                              zoom: 14.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
