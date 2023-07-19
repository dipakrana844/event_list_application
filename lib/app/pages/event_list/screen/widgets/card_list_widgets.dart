import 'package:event_listing/app/common/widgets/text_widget.dart';
import 'package:event_listing/app/pages/event_list/controller/event_list_controller.dart';
import 'package:event_listing/app/pages/event_list/model/event_list_model.dart';
import 'package:event_listing/app/pages/event_list/screen/widgets/icon_widget.dart';
import 'package:event_listing/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListWidgets extends StatelessWidget {
  final int index;
  final EventListModel moEventDetail;
  final bool mbIsSaved;
  CardListWidgets(
      {super.key,
      required this.moEventDetail,
      required this.index,
      required this.mbIsSaved});
  final eventDetailCtr = Get.find<EventListController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200]!,
      child: GestureDetector(
        onTap: () {
          debugPrint("index -> $index");
          Get.toNamed(
            AppRoutes.EVENTDETAIL,
            arguments: moEventDetail.item![index].toJson(),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // transform: Matrix4.rotationZ(0.1),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 3),
                          /*boxShadow: const [
                                             BoxShadow(
                                              color: Colors.green,
                                              offset:  Offset(6.0, 6.0),
                                            ),
                                          ],*/
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 100,
                        width: 100,
                        child: Image.network(
                          moEventDetail.item![index].thumbUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: moEventDetail.item![index].eventname
                                    .toString(),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Inter",
                                    fontSize: 16)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: moEventDetail.item![index].startTimeDisplay
                                  .toString(),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                                text: moEventDetail
                                    .item![index].venue!.fullAddress
                                    .toString(),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Inter",
                                    fontSize: 12)),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconWidgets(
                                  icon: Icons.share,
                                  color: Colors.black,
                                  onTap: () {
                                    debugPrint("Click");
                                  },
                                  index: 0,
                                ),
                                GetBuilder<EventListController>(
                                    builder: (cardListCtr) {
                                  return IconWidgets(
                                    icon: mbIsSaved
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        mbIsSaved ? Colors.red : Colors.black,
                                    onTap: () {
                                      debugPrint("Click");
                                      // eventDetailCtr.toggleSelection();
                                      if (mbIsSaved) {
                                        eventDetailCtr.favoriteList
                                            .remove(moEventDetail.item![index]);
                                      } else {
                                        eventDetailCtr.favoriteList
                                            .add(moEventDetail.item![index]);
                                      }
                                      eventDetailCtr.update();
                                    },
                                    index: 2,
                                  );
                                }),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
