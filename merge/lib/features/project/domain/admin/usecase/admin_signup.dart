import 'package:merge/features/project/domain/admin/entity/admin.dart';
import 'package:merge/features/project/domain/admin/repository/admin_repository.dart';

class AdminSignup {
  final IAdminRepository
      adminRepository; // Use IAdminRepository instead of AdminRepository

  AdminSignup(this.adminRepository);

  Future<void> call(Admin admin) async {
    await adminRepository.signUpAdmin(
        admin); // Use signUpAdmin method from the repository interface
  }
}
