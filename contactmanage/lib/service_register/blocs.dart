import 'package:contactmanage/dependency/dependency_injection.dart';
import 'package:contactmanage/features/dashboard/presentation/cubit/contact_cubit.dart';

class RegisterBlocs {
  RegisterBlocs() {
    locator.registerFactory(
      () => ContactCubit(locator()),
    );
  }
}
