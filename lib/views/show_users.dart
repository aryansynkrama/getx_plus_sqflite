import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/controller/user_controller.dart';

class ShowUsers extends StatelessWidget {
  ShowUsers({Key? key}) : super(key: key);
  final UserController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(controller.users[index].id.toString()),
                    ),
                    title: Text(controller.users[index].username),
                    subtitle: Text(controller.users[index].password),
                    onLongPress: () => controller
                        .deleteTask(controller.users[index].id!.toInt()),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        controller.usernameController!.text =
                            controller.users[index].username;
                        controller.passwordController!.text =
                            controller.users[index].password;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Edit User'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: controller.usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.updateTask(
                                    controller.users[index].id!.toInt(),
                                    controller.usernameController!.text,
                                    controller.passwordController!.text,
                                  );
                                  controller.usernameController!.clear();
                                  controller.passwordController!.clear();
                                  Get.back();
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
