import 'package:get_it/get_it.dart';
import 'package:tasky_app/feature/auth/domain/user_cases/login_user_case.dart';
import 'package:tasky_app/feature/auth/domain/user_cases/logout_user_case.dart';
import 'package:tasky_app/feature/auth/domain/user_cases/register_user_case.dart';
import '../../feature/auth/data/data_source/auth_service_data_source_impl.dart';
import '../services/api_data_service.dart';
import '../services/api_services.dart';
import '../../feature/auth/data/data_source/auth_services_data_source.dart';
import '../services/data_service.dart';
import '../services/dio_api_service.dart';
import '../../feature/create_edit/data/repo/task_operation_repo.dart';
import '../../feature/home/data/repo/home_repo.dart';
import '../../feature/home/data/repo/home_repo_impl.dart';

import '../../feature/auth/domain/repo/auth_repo.dart';
import '../../feature/auth/data/repos/auth_repo_impl.dart';
import '../../feature/create_edit/data/repo/task_operation_repo_impl.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<ApiServices>(DioApiServices());
  getIt.registerSingleton<DataService>(
    ApiDataService(
      getIt.get<ApiServices>(),
    ),
  );

  getIt.registerSingleton<AuthServicesDataSource>(
    AuthServicesDataSourceImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authServices: getIt.get<AuthServicesDataSource>(),
    ),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      dataService: getIt.get<DataService>(),
    ),
  );
  getIt.registerSingleton<TaskOperationRepo>(
    TaskOperationRepoImpl(
      dataService: getIt.get<DataService>(),
    ),
  );

  // Auth user case
  getIt.registerSingleton<LoginUserCase>(
    LoginUserCase(
      authRepo: getIt.get<AuthRepo>(),
    ),
  );
  getIt.registerSingleton<RegisterUserCase>(
    RegisterUserCase(
      authRepo: getIt.get<AuthRepo>(),
    ),
  );
  getIt.registerSingleton<LogoutUserCase>(
    LogoutUserCase(
      authRepo: getIt.get<AuthRepo>(),
    ),
  );
}
