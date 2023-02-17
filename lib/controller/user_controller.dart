import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/database/database_helper.dart';

import '../model/user_model.dart';

// A controller to manage a list of users and perform CRUD operations on it
class UserController extends GetxController {

  // An observable list of users
  // RxList<User> users = RxList<User>();
  var users = [].obs;

  // Text editing controllers for the username and password fields
  TextEditingController? usernameController;
  TextEditingController? passwordController;

  @override
  void onInit() {
    // Initialize the username and password text editing controllers
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    // Load data from the database
    getData();

    super.onInit();
  }

  // Retrieve all users from the database and add them to the list
  void getData() async {
    DatabaseHelper.instance.getAllRows().then((value) {
      for (var element in value) {
        users.add(User(
            id: element['id'],
            username: element['username'],
            password: element['password']));
      }
    });
  }

  // Add a new user to the database and list
  void addData() async {
    // Check if username and password fields are not empty
    if(usernameController!.text.isEmpty || passwordController!.text.isEmpty){
      return;
    }

    // Insert the new user into the database
    await DatabaseHelper.instance.insert(
      User(
        username: usernameController!.text,
        password: passwordController!.text,
      ),
    );

    // Add the new user to the list
    users.insert(
      0,
      User(
        id: users.length,
        username: usernameController!.text,
        password: passwordController!.text,
      ),
    );

    // Clear the text fields
    usernameController!.clear();
    passwordController!.clear();
  }

  // Delete a user from the database and list
  void deleteTask(int id) async {
    // Delete the user from the database
    await DatabaseHelper.instance.delete(id);

    // Remove the user from the list
    users.removeWhere((element) => element.id == id);
  }

  // Update a user in the database and list
  void updateTask(int id, String updatedUsername, String updatedPassword) async {
    // Update the user in the database
    await DatabaseHelper.instance.update(
        User(id: id, username: updatedUsername, password: updatedPassword));

    // Find the index of the user in the list
    int index = users.indexWhere((element) => element.id == id);
    if (index >= 0) {
      // Update the user in the list
      users[index] = User(id: id, username: updatedUsername, password: updatedPassword);
    }
  }
}


// void deleteTask(int id) async {
//   await DatabaseHelper.instance.delete(id);
//   final int index = users.indexWhere((element) => element.id == id);
//   if(index >= 0){
//     users.removeAt(index);
//     for(int i = index;i<users.length;i++){
//       users[i] = users[i].copyWith(id: i + 1);
//       await DatabaseHelper.instance.update(users[i]);
//     }
//   }
//
// }
