import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:httpclient/util/logger/logger.dart';
import 'package:logger/web.dart';

import '../AppUrl/AppCallUri.dart';
import '../Services/HttpServices.dart';
import '../models/usermodel.dart';

class GetController extends GetxController {
  var users = <Users>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    GetUser();
  }

  Future<void> GetUser() async {
    isLoading.value = true;
    try {
      HttpClientResponse response = await HttpService.getResponse();
      String responseBody = await response.transform(utf8.decoder).join();
      final List<dynamic> jsonData = json.decode(responseBody);
      final List<Users> userList =
          jsonData.map((jsonItem) => Users.fromJson(jsonItem)).toList();
      users.value = userList;
    } catch (e) {
      CallLog.callLogError(e);
    } finally {
      isLoading.value = false;
    }
  }
}
