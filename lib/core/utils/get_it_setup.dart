import 'package:get_it/get_it.dart';
import 'package:tasky_app/core/services/api_services.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/services/data_service.dart';
import 'package:tasky_app/feature/create_edit/data/repo/task_operation_repo.dart';
import 'package:tasky_app/feature/home/data/repo/home_repo.dart';
import 'package:tasky_app/feature/home/data/repo/home_repo_impl.dart';

import '../../feature/auth/data/repos/auth_repo.dart';
import '../../feature/auth/data/repos/auth_repo_impl.dart';
import '../../feature/create_edit/data/repo/task_operation_repo_impl.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<DataService>(
    DataService(
      getIt.get<ApiServices>(),
    ),
  );
  
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
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      dataService: getIt.get<DataService>(),
      authServices: getIt.get<AuthServices>(),
    ),
  );
  getIt.registerSingleton<TaskOperationRepo>(
    TaskOperationRepoImpl(
      dataService: getIt.get<DataService>(),
      authServices: getIt.get<AuthServices>(),
    ),
  );
}
