import 'package:contactmanage/dependency/dependency_injection.dart';
import 'package:contactmanage/features/dashboard/data/datasource/remote_datasource.dart';

class RegisterDataSources {
  RegisterDataSources() {
    locator.registerLazySingleton<ContactDataSource>(
      () => ContactDataSourceImp(),
    );
  }
}
