import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Services/HttpServices.dart';
import '../models/userpostmodel.dart';

class DeleteController extends GetxController {
  final TextEditingController IdController = TextEditingController();

  Future<void> deleteData({required PostUser postUser}) async {
    try {
      final HttpClientResponse response =
          await HttpService.deleteResponse(postUser);

      final String responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == HttpStatus.ok) {
        Get.snackbar('Success', 'Data delete successfully');
      } else {
        Get.snackbar('Error',
            'Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Exception', 'An error occurred: $e');
    }
  }
}
