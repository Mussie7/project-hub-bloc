// test/unit/user_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:merge/features/project/data/models/user_model.dart';
import 'package:merge/features/project/domain/user/entity/user.dart';

void main() {
  group('UserModel', () {
    UserModel userModel = UserModel(
      id: '1',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      password: 'password',
    );

    test('toDomain converts UserModel to User entity', () {
      final user = userModel.toDomain();
      expect(user.id, userModel.id);
      expect(user.firstName, userModel.firstName);
      expect(user.lastName, userModel.lastName);
      expect(user.email, userModel.email);
      expect(user.password, userModel.password);
    });

    test('fromDomain converts User entity to UserModel', () {
      User user = User(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        password: 'password',
      );

      final model = UserModel.fromDomain(user);
      expect(model.id, user.id);
      expect(model.firstName, user.firstName);
      expect(model.lastName, user.lastName);
      expect(model.email, user.email);
      expect(model.password, user.password);
    });

    test('toJson converts UserModel to JSON', () {
      final json = userModel.toJson();
      expect(json, {
        '_id': '1',
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john.doe@example.com',
        'password': 'password',
      });
    });

    test('fromJson creates UserModel from JSON', () {
      final json = {
        '_id': '1',
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john.doe@example.com',
        'password': 'password',
      };

      final model = UserModel.fromJson(json);
      expect(model.id, '1');
      expect(model.firstName, 'John');
      expect(model.lastName, 'Doe');
      expect(model.email, 'john.doe@example.com');
      expect(model.password, 'password');
    });
  });
}
