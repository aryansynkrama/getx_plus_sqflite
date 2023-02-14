import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/database/database_helper.dart';

import '../model/user_model.dart';

class UserController extends GetxController {
  RxList<User> users = RxList<User>();
  TextEditingController? usernameController;
  TextEditingController? passwordController;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData() async {
    DatabaseHelper.instance.getAllRows().then((value) {
      for (var element in value) {
        users.add(User(
            id: element['id'],
            username: element['username'],
            password: element['password']));
      }
    });
  }

  void addData() async {
    await DatabaseHelper.instance.insert(User(
        username: usernameController!.text,
        password: passwordController!.text));
    users.insert(
        0,
        User(
            id: users.length,
            username: usernameController!.text,
            password: passwordController!.text));
    usernameController!.clear();
    passwordController!.clear();
  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    users.removeWhere((element) => element.id == id);
  }

  void updateTask(
      int id, String updatedUsername, String updatedPassword) async {
    await DatabaseHelper.instance.update(
        User(id: id, username: updatedUsername, password: updatedPassword));
    int index = users.indexWhere((element) => element.id == id);
    if (index >= 0) {
      users[index] =
          User(id: id, username: updatedUsername, password: updatedPassword);
    }
  }
}
