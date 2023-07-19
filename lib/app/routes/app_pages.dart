import 'package:event_listing/app/pages/event_detail/binding/event_detail_binding.dart';
import 'package:event_listing/app/pages/event_detail/screens/event_detail_page.dart';
import 'package:event_listing/app/pages/event_list/binding/event_list_binding.dart';
import 'package:event_listing/app/pages/event_list/screen/event_list_Page.dart';
import 'package:event_listing/app/pages/home/binding/homeBinding.dart';
import 'package:event_listing/app/pages/home/screen/home.dart';
import 'package:event_listing/app/pages/login/binding/login_binding.dart';
import 'package:event_listing/app/pages/login/screen/login_page.dart';
import 'package:event_listing/app/pages/web_view/web_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.EVENTLIST,
      page: () => const EventListPage(),
      binding: EventListBinding(),
    ),
    GetPage(
      name: Paths.EVENTDETAIL,
      page: () => EventDetailPage(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Paths.WebPage,
      page: () => const WebViewPage(),
    ),
  ];
}
