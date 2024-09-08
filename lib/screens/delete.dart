import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:httpclient/controllers/deleteCtrl.dart';
import 'package:httpclient/controllers/postCtrl.dart';
import 'package:httpclient/models/userpostmodel.dart';

class DeleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Page'),
      ),
      body: GetBuilder<DeleteController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.IdController,
                  decoration: InputDecoration(labelText: ' ID'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    PostUser postUser = PostUser(
                      id: int.tryParse(controller.IdController.text) ?? 0,
                    );
                    await controller.deleteData(postUser: postUser);
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
