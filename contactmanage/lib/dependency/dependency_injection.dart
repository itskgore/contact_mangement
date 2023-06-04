import 'package:get_it/get_it.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service_register/blocs.dart';
import '../service_register/data_source.dart';
import '../service_register/repos.dart';
import '../service_register/usecases.dart';

GetIt locator = GetIt.instance;

Future<void> setupServicesLocator() async {
  /// register all the call flow with the service locator
  /// bloc => usecase => repository => datasource
  RegisterBlocs();
  RegisterUseCases();
  RegisterRepository();
  RegisterDataSources();

  //external
  final _sharedPreferences = SharedPreferences.getInstance();
  final SharedPreferences sharedPreferences = await _sharedPreferences;
  locator.registerLazySingleton(() => sharedPreferences);
}
