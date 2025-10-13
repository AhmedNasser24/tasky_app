import 'package:get_it/get_it.dart';
import 'package:tasky_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_one_task_cubit/fetch_one_task_cubit_cubit.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';
import '../../feature/auth/domain/user_cases/login_user_case.dart';
import '../../feature/auth/domain/user_cases/logout_user_case.dart';
import '../../feature/auth/domain/user_cases/register_user_case.dart';
import '../../feature/auth/data/data_source/auth_service_data_source_impl.dart';
import '../../feature/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../feature/auth/presentation/manager/register_cubit/register_cubit.dart';
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
  // خلي بالك من الترتيب مينفع انادي علي حاجة وهي لسه متعملهاش ريجستير

  // services
  getIt.registerLazySingleton<ApiServices>(() => DioApiServices());
  // data source
  getIt.registerLazySingleton<DataSource>(
    () => DataSourceImpl(
      apiServices: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthServicesDataSource>(
    () => AuthServicesDataSourceImpl(
      apiServices: getIt(),
    ),
  );
  // repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authServicesDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<TaskOperationRepo>(
    () => TaskOperationRepoImpl(
      dataSource: getIt(),
    ),
  );
  // user cases
  // Auth user case
  getIt.registerLazySingleton<LoginUserCase>(
    () => LoginUserCase(
      authRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton<RegisterUserCase>(
    () => RegisterUserCase(
      authRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton<LogoutUserCase>(
    () => LogoutUserCase(
      authRepo: getIt(),
    ),
  );

  // home user cases
  getIt.registerLazySingleton<FetchAllTaskUserCase>(
      () => FetchAllTaskUserCase(taskOperationRepo: getIt()));
  getIt.registerLazySingleton<FetchOneTaskUserCase>(
      () => FetchOneTaskUserCase(taskOperationRepo: getIt()));
  getIt.registerLazySingleton<CreateTaskUserCase>(
      () => CreateTaskUserCase(taskOperationRepo: getIt()));
  getIt.registerLazySingleton<EditTaskUserCase>(
      () => EditTaskUserCase(taskOperationRepo: getIt()));
  getIt.registerLazySingleton<DeleteTaskUserCase>(
      () => DeleteTaskUserCase(taskOperationRepo: getIt()));

  // cubit
  getIt.registerFactory<TaskOperationCubit>(
    () => TaskOperationCubit(
      fetchAllTaskUserCase: getIt(),
      createTaskUserCase: getIt(),
      editTaskUserCase: getIt(),
      deleteTaskUserCase: getIt(),
    ),
  );

  getIt.registerFactory<FetchOneTaskCubit>(
      () => FetchOneTaskCubit(fetchOneTaskUserCase: getIt()));

  getIt
      .registerFactory<LogoutCubit>(() => LogoutCubit(logoutUserCase: getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginUserCase: getIt()));

  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerUserCase: getIt()));
}
