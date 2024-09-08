import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bindings/binding.dart';
import 'routers/Approuter.dart';
import 'routers/route.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.get,
      getPages: AppRouters.routers,
      initialBinding: HomeBinding(),
    ),
  );
}
