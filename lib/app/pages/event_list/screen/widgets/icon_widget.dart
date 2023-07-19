import 'package:event_listing/app/pages/event_list/controller/event_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconWidgets extends StatelessWidget {
  final int index;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  IconWidgets(
      {super.key,
      required this.icon,
      this.onTap,
      required this.index,
      required this.color});
  final eventDetailCtr = Get.find<EventListController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
