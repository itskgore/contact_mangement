import 'package:contactmanage/dependency/dependency_injection.dart';
import 'package:contactmanage/features/dashboard/domain/usecase/get_contact_usecase.dart';

class RegisterUseCases {
  RegisterUseCases() {
    locator.registerLazySingleton(() => GetContactUsecase(
          locator(),
        ));
  }
}
