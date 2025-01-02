import 'package:get_it/get_it.dart';
import 'package:tasky_app/core/services/api_services.dart';
import 'package:tasky_app/core/services/auth_services.dart';

import '../../feature/auth/data/repos/auth_repo.dart';
import '../../feature/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<AuthServices>(
    AuthServices(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authServices: getIt.get<AuthServices>(),
    ),
  );
}
