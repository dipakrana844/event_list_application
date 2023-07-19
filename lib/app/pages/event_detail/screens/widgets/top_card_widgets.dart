import 'package:event_listing/app/pages/event_detail/controller/event_detail_controller.dart';
import 'package:event_listing/app/pages/event_list/controller/event_list_controller.dart';
import 'package:event_listing/app/pages/event_list/screen/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopCardWidget extends StatelessWidget {
  TopCardWidget({super.key});
  final eventListCtr = Get.find<EventListController>();
  final eventDetailCtr = Get.find<EventDetailController>();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: 200,
              child: Image.network(
                eventDetailCtr.moItem.thumbUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 280,
                    child: Text(
                      eventDetailCtr.moItem.eventnameRaw.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconWidgets(
                    icon: Icons.star_border,
                    color: Colors.black,
                    onTap: () {
                      debugPrint("Click");
                      eventListCtr.toggleSelection();
                    },
                    index: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
