import 'package:get_it/get_it.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_one_task_cubit/fetch_one_task_cubit_cubit.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';
import '../../feature/auth/domain/user_cases/login_user_case.dart';
import '../../feature/auth/domain/user_cases/logout_user_case.dart';
import '../../feature/auth/domain/user_cases/register_user_case.dart';
import '../../feature/auth/data/data_source/auth_service_data_source_impl.dart';
import '../../feature/home/data/data_source/data_source_impl.dart';
import '../../feature/home/domain/user_cases/create_task_user_case.dart';
import '../../feature/home/domain/user_cases/delete_task_user_case.dart';
import '../../feature/home/domain/user_cases/edit_task_user_case.dart';
import '../../feature/home/domain/user_cases/fetch_all_task_user_case.dart';
import '../../feature/home/domain/user_cases/fetch_one_task_user_case.dart';
import '../services/api_services.dart';
import '../../feature/auth/data/data_source/auth_services_data_source.dart';
import '../../feature/home/data/data_source/data_source.dart';
import '../services/dio_api_service.dart';
import '../../feature/home/domain/repo/task_operation_repo.dart';

import '../../feature/auth/domain/repo/auth_repo.dart';
import '../../feature/auth/data/repos/auth_repo_impl.dart';
import '../../feature/home/data/repo/task_operation_repo_impl.dart';

final getIt = GetIt.instance;

void getItSetup() {
  // cubit
  // getIt.registerSingleton<TaskOperationCubit>(
  //    TaskOperationCubit(
  //       fetchAllTaskUserCase: getIt.get<FetchAllTaskUserCase>(),
  //       createTaskUserCase: getIt.get<CreateTaskUserCase>(),
  //       editTaskUserCase: getIt.get<EditTaskUserCase>(),
  //       deleteTaskUserCase: getIt.get<DeleteTaskUserCase>()),
  // );

  // getIt.registerSingleton<FetchOneTaskCubit>( FetchOneTaskCubit(fetchOneTaskUserCase: getIt.get<FetchOneTaskUserCase>()));

  
 

  

  // services
  getIt.registerSingleton<ApiServices>(DioApiServices());
  // data source
  getIt.registerSingleton<DataSource>(
    DataSourceImpl(
      apiServices : getIt.get<ApiServices>(),
    ),
  );

  getIt.registerSingleton<AuthServicesDataSource>(
    AuthServicesDataSourceImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
   // repo
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authServicesDataSource: getIt.get<AuthServicesDataSource>(),
    ),
  );

  getIt.registerSingleton<TaskOperationRepo>(
    TaskOperationRepoImpl(
      dataSource: getIt.get<DataSource>(),
    ),
  );
  // user cases
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

  // home user cases
  getIt.registerSingleton<FetchAllTaskUserCase>(
      FetchAllTaskUserCase(taskOperationRepo: getIt.get<TaskOperationRepo>()));
  getIt.registerSingleton<FetchOneTaskUserCase>(
      FetchOneTaskUserCase(taskOperationRepo: getIt.get<TaskOperationRepo>()));
  getIt.registerSingleton<CreateTaskUserCase>(
      CreateTaskUserCase(taskOperationRepo: getIt.get<TaskOperationRepo>()));
  getIt.registerSingleton<EditTaskUserCase>(
      EditTaskUserCase(taskOperationRepo: getIt.get<TaskOperationRepo>()));
  getIt.registerSingleton<DeleteTaskUserCase>(
      DeleteTaskUserCase(taskOperationRepo: getIt.get<TaskOperationRepo>()));

}
