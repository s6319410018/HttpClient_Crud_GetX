import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:httpclient/AppUrl/AppCallUri.dart';
import 'package:httpclient/models/userpostmodel.dart';
import 'package:httpclient/util/logger/logger.dart';
import '../Services/HttpServices.dart';

class PostController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController IdController = TextEditingController();

  Future<void> postData({required PostUser postUser}) async {
    final HttpClientResponse response =
        await HttpService.postResponse(postUser);

    String responseBody = await response.transform(utf8.decoder).join();
    CallLog.callLogDebug(responseBody);
    Get.snackbar('Success', responseBody);
  }

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    userIdController.dispose();
    IdController.dispose();
    super.onClose();
  }
}
