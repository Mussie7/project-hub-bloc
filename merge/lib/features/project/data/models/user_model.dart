import 'package:merge/features/project/domain/user/entity/user.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: "Mussie",
      lastName: "Asamere",
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  User toDomain() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }

  static UserModel fromDomain(User user) {
    return UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      password: user.password,
    );
  }
}
