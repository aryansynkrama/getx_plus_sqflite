// Define a class called User
class User {
  // Declare three properties for the User class: id, username, and password.
  final int? id; // id is optional and can be null
  final String username; // username is required and cannot be null
  final String password; // password is required and cannot be null

  // Define a constructor for the User class that can accept an optional id and required username and password.
  User({this.id, required this.username, required this.password});

  // Define a factory method called fromMap, which takes a Map object as input and returns a User object.
  factory User.fromMap(Map<String, dynamic> json) {
    // Create a new User object with the data from the map, using the named constructor defined earlier.
    return User(
      id: json['id'], // Set the value of id to the value of the 'id' key in the map.
      username: json['username'], // Set the value of username to the value of the 'username' key in the map.
      password: json['password'], // Set the value of password to the value of the 'password' key in the map.
    );
  }

  // Define a method called toMap, which returns a Map object representing the User object.
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add the id property to the map, with its current value.
      'username': username, // Add the username property to the map, with its current value.
      'password': password, // Add the password property to the map, with its current value.
    };
  }
}
