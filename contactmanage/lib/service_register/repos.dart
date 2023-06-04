import 'package:contactmanage/dependency/dependency_injection.dart';
import 'package:contactmanage/features/dashboard/data/repo_imp/contact_repo_imp.dart';
import 'package:contactmanage/features/dashboard/domain/repo/contact_repo.dart';

class RegisterRepository {
  RegisterRepository() {
    locator.registerLazySingleton<ContactRepository>(
      () => ContactRepositoryImp(locator()),
    );
  }
}
