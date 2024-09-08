import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../AppUrl/AppCallUri.dart';
import '../Services/HttpServices.dart';
import '../models/userpostmodel.dart';

class PushController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController IdController = TextEditingController();

  Future<void> pushData({required PostUser postUser}) async {
    try {
      final HttpClientResponse response =
          await HttpService.pushResponse(postUser);

      final String responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == HttpStatus.ok) {
        Get.snackbar('Success', 'Data updated successfully');
      } else {
        Get.snackbar('Error',
            'Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Exception', 'An error occurred: $e');
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    userIdController.dispose();
    super.onClose();
  }
}
