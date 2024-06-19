// test/models/admin_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:merge/features/project/data/models/admin_model.dart';

void main() {
  group('AdminModel', () {
    AdminModel adminModel = const AdminModel(
      email: 'admin@example.com',
      password: 'password123',
    );

    test('should convert AdminModel to Admin entity', () {
      final admin = adminModel.toEntity();
      expect(admin.email, adminModel.email);
      expect(admin.password, adminModel.password);
    });

    test('should support value comparisons', () {
      expect(adminModel, adminModel);
      expect(adminModel.props, [adminModel.email, adminModel.password]);
    });
  });
}
