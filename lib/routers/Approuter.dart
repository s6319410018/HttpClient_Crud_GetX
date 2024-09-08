import 'package:get/get.dart';
import 'package:httpclient/routers/route.dart';
import 'package:httpclient/screens/get.dart';
import 'package:httpclient/screens/post.dart';
import 'package:httpclient/screens/push.dart';

import '../screens/delete.dart';

class AppRouters {
  static var routers = [
    GetPage(name: Routes.get, page: () => GetScreen()),
    GetPage(name: Routes.post, page: () => PostScreen()),
    GetPage(name: Routes.push, page: () => PushScreen()),
    GetPage(name: Routes.delete, page: () => DeleteScreen()),
  ];
}
