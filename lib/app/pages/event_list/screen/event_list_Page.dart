import 'package:event_listing/app/pages/event_list/controller/event_list_controller.dart';
import 'package:event_listing/app/pages/event_list/model/event_list_model.dart';
import 'package:event_listing/app/pages/event_list/screen/widgets/card_grid_widget.dart';
import 'package:event_listing/app/pages/event_list/screen/widgets/card_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListPage extends GetView<EventListController> {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EventListController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Get.back();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          Get.arguments[0].toString(),
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          GetBuilder<EventListController>(builder: (eventListCt) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  controller.viewSwitching();
                },
                icon: controller.moViewType == ViewType.list
                    ? const Icon(Icons.grid_on)
                    : const Icon(Icons.view_list),
              ),
            );
          }),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.back();
          Get.back();
          return Future(() => false);
        },
        child: Obx(
          () => controller.mbEventDataGet.value
              ? GetBuilder<EventListController>(builder: (eventListCtr) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.moCrossAxisCount,
                          childAspectRatio: controller.moAspectRatio,
                          // crossAxisSpacing: 60.0,
                          mainAxisExtent: controller.moMainAxisExtent.value,
                          // mainAxisSpacing: 20.0,
                        ),
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.moEventDetail.item!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Item item = controller.moEventDetail.item![index];
                          bool isSaved = controller.favoriteList.contains(item);
                          return getGridItem(
                              controller.moEventDetail.item!, index, isSaved);
                        }),
                  );
                })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  GridTile getGridItem(List<Item> list, int index, bool isSaved) {
    return GridTile(
      child: controller.moViewType == ViewType.list
          ? CardListWidgets(
              index: index,
              moEventDetail: controller.moEventDetail,
              mbIsSaved: isSaved,
            )
          : CardGridWidgets(
              moEventDetail: controller.moEventDetail,
              index: index,
              mbIsSaved: isSaved,
            ),
    );
  }
}

enum ViewType { grid, list }
