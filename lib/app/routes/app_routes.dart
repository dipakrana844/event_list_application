class AppRoutes {
  AppRoutes._();

  static const LOGIN = Paths.LOGIN;
  static const HOME = Paths.HOME;
  static const EVENTLIST = Paths.EVENTLIST;
  static const EVENTDETAIL = Paths.EVENTDETAIL;
  static const WebPage = Paths.WebPage;
}

abstract class Paths {
  static const LOGIN = '/LoginPage';
  static const HOME = '/HomePage';
  static const EVENTLIST = '/EventListPage';
  static const EVENTDETAIL = '/EventDetailPage';
  static const WebPage = '/WebPage';
}
