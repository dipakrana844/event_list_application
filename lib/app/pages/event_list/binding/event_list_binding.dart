import 'package:event_listing/app/pages/event_list/controller/event_list_controller.dart';
import 'package:get/get.dart';

class EventListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<EventListController>(
      () => EventListController(),
    );
  }
}
