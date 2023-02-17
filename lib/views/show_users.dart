import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/controller/user_controller.dart';

// This class defines a stateless widget called ShowUsers that displays a list of users, allows the user to edit user data, and
// delete users from a UserController instance using Get for dependency injection.
class ShowUsers extends StatelessWidget {
  ShowUsers({Key? key}) : super(key: key);

  // A UserController object is created using Get.find() to handle user data.
  final UserController controller = Get.find<UserController>();

  // This method builds and returns the UI for this widget.
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
                // The number of items in the list is determined by the number of users in the UserController.
                itemCount: controller.users.length,
                // This method is called for every user in the list and returns a Card with a ListTile containing user data.
                itemBuilder: (context, index) => Card(
                  // This widget creates a CircleAvatar with the user ID displayed inside a green circle.
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(controller.users[index].id.toString()),
                    ),
                    // This widget displays the user's username.
                    title: Text(controller.users[index].username),
                    // This widget displays the user's password.
                    subtitle: Text(controller.users[index].password),
                    // This function is called when a user is long pressed and deletes the user from the list.
                    onLongPress: () => controller
                        .deleteTask(controller.users[index].id!.toInt()),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // The username and password of the selected user is set as the default value for the
                        // username and password fields in the AlertDialog.
                        controller.usernameController!.text =
                            controller.users[index].username;
                        controller.passwordController!.text =
                            controller.users[index].password;
                        // This widget creates an AlertDialog with two buttons - one for canceling the edit and one for saving
                        // the changes.
                        Get.dialog(

                          AlertDialog(
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
                                  // This function updates the user data with the values in the username and password fields in the
                                  // AlertDialog and clears the fields.

                                  controller.updateTask(
                                    controller.users[index].id!.toInt(),
                                    controller.usernameController?.text ?? "",
                                    controller.passwordController?.text ?? "",
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
