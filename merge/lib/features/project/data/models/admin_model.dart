import 'package:equatable/equatable.dart';
import 'package:merge/features/project/domain/admin/entity/admin.dart';

class AdminModel extends Equatable {
  final String email;
  final String password;

  const AdminModel({
    required this.email,
    required this.password,
  });

  // Convert AdminModel to Admin entity
  Admin toEntity() {
    return Admin(
      email: email,
      password: password,
    );
  }

  @override
  List<Object?> get props => [email, password];

  @override
  bool get stringify => true; // This is optional, used for debugging
}
