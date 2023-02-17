import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/controller/user_controller.dart';
import 'package:onboarding_screen_with_getx/views/show_users.dart';

import '../model/user_model.dart';

class UserLogin extends StatelessWidget {
  UserLogin({Key? key}) : super(key: key);
  final UserController controller =
      Get.put(UserController()); // Get the instance of UserController class.

  @override
  Widget build(BuildContext context) {
    var screenHeight = Get.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Using Sqflite"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Text form field for username input
              TextFormField(
                controller: controller.usernameController,
                // Set the controller for this text field
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username', // Placeholder text
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Text form field for password input
              TextFormField(
                controller: controller.passwordController,
                // Set the controller for this text field
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password', // Placeholder text
                ),
              ),
              // Elevated button for sign in
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  // Validate and add user data

                  controller.addData();

                },
                child: Text("Sign In"),
              ),
              SizedBox(height: screenHeight * 0.01),
              ElevatedButton(
                onPressed: () => Get.to(() => ShowUsers()),
                // Navigate to ShowUsers page
                child: Text("Show Users"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
