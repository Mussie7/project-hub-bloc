// domain/entities/admin.dart
import 'package:equatable/equatable.dart';

class Admin extends Equatable {
  final String email;
  final String password;

  const Admin({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
