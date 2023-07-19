import 'package:event_listing/app/pages/event_detail/controller/event_detail_controller.dart';
import 'package:get/get.dart';

class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(
      () => EventDetailController(),
    );
  }
}
