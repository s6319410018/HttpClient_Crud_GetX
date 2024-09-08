import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:httpclient/controllers/getCtrl.dart';
import 'package:httpclient/screens/delete.dart';
import 'package:httpclient/screens/post.dart';
import 'package:httpclient/screens/push.dart';

class GetScreen extends StatelessWidget {
  const GetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: GetBuilder<GetController>(
        builder: (controller) {
          return Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.users.length,
                          itemBuilder: (context, index) {
                            final user = controller.users[index];
                            return ListTile(
                              title: Text("${user.name}"),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () => controller.GetUser(),
                          child: const Text('Refresh'),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(() => PostScreen());
                              },
                              child: const Text("Gotopost")),
                          TextButton(
                              onPressed: () {
                                Get.to(() => PushScreen());
                              },
                              child: const Text("Gotopost")),
                          TextButton(
                              onPressed: () {
                                Get.to(() => DeleteScreen());
                              },
                              child: const Text("GotoDelete")),
                        ],
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
