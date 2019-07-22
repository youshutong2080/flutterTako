import 'package:fluro/fluro.dart';
import '../tabs/pages/Apps.dart';
import '../tabs/pages/Detail.dart';
import '../tabs/pages/History.dart';
import '../tabs/pages/ScreenImage.dart';
import '../tabs/pages/Download.dart';
import '../tabs/pages/User.dart';
import '../tabs/pages/Services.dart';
import '../tabs/pages/Login.dart';


class Routers {
  static Router router;
  static void configRouters(Router router) {
    router.define("apps", handler: Handler(handlerFunc: (context, params) => AppsPage()));
    router.define("detail", handler: Handler(handlerFunc: (context, params) => DetailPage(title: params['title']?.first)));
    router.define("history", handler: Handler(handlerFunc: (context, params) => HistoryPage()));
    router.define("download", handler: Handler(handlerFunc: (context, params) => DownloadPage()));
    router.define("user", handler: Handler(handlerFunc: (context, params) => UserPage()));
    router.define("services", handler: Handler(handlerFunc: (context, params) => ServicesPage()));
    router.define("login", handler: Handler(handlerFunc: (context, params) => LoginPage()));

    router.define("screen", handler: Handler(handlerFunc: (context, params) => ScreenImage(assets: params['screen']?.first)));

    Routers.router = router;
  }
}