import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/controller/user_controller.dart';
import 'package:onboarding_screen_with_getx/views/show_users.dart';

import '../model/user_model.dart';

class UserLogin extends StatelessWidget {
  UserLogin({Key? key}) : super(key: key);
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
            ElevatedButton(
              onPressed: () {
                controller.addData();
              },
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => ShowUsers()),
              child: Text("Show Users"),
            ),
          ],
        ),
      ),
    );
  }
}
