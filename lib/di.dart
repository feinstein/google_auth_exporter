import 'package:get_it/get_it.dart';

import 'data/data_sources/qr_code_data_source.dart';
import 'data/repositories/google_auth_repository.dart';

GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerFactory(() => QrCodeDataSource());
  getIt.registerFactory(() => GoogleAuthRepository(getIt()));
}
