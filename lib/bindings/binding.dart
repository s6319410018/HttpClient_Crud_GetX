import 'package:get/get.dart';
import 'package:httpclient/controllers/postCtrl.dart';
import 'package:httpclient/controllers/pushCtrl.dart';

import '../controllers/deleteCtrl.dart';
import '../controllers/getCtrl.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetController>(() => GetController(), fenix: true);
    Get.lazyPut<PostController>(() => PostController(), fenix: true);
    Get.lazyPut<PushController>(() => PushController(), fenix: true);
    Get.lazyPut<DeleteController>(() => DeleteController(), fenix: true);
  }
}
