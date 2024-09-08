import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:httpclient/controllers/pushCtrl.dart';

import '../models/userpostmodel.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Page'),
      ),
      body: GetBuilder<PushController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: controller.bodyController,
                  decoration: InputDecoration(labelText: 'Body'),
                ),
                TextField(
                  controller: controller.userIdController,
                  decoration: InputDecoration(labelText: 'User ID'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller.IdController,
                  decoration: InputDecoration(labelText: ' ID'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    PostUser postUser = PostUser(
                      title: controller.titleController.text,
                      body: controller.bodyController.text,
                      userId:
                          int.tryParse(controller.userIdController.text) ?? 0,
                      id: int.tryParse(controller.IdController.text) ?? 0,
                    );
                    await controller.pushData(postUser: postUser);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
