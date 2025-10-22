// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_pet/app_versions/store/main/presentation/screens/store_activation.dart';
// import 'package:my_pet/app_versions/store/notification/presentation/pages/store_notification_page.dart';
// import 'package:my_pet/app_versions/store/profile/presentation/cubit/profile_cubit.dart';
// import 'package:my_pet/app_versions/store/review/presentation/screens/reviews_page.dart';
// import 'package:my_pet/core/dependency_injection/dependency_injection.dart';
// import 'package:my_pet/app_versions/store/clinic/data/models/reservations_model.dart';
// import 'package:my_pet/app_versions/store/clinic/presentation/cubit/clinic_cubit.dart';
// import 'package:my_pet/app_versions/store/clinic/presentation/screen/add_new_examination.dart';
// import 'package:my_pet/app_versions/store/clinic/presentation/screen/qr_scanner.dart';
// import 'package:my_pet/app_versions/store/clinic/presentation/screen/reservation_details.dart';
// import 'package:my_pet/app_versions/store/clinic/presentation/screen/examination_details.dart';
// import 'package:my_pet/app_versions/store/home/screens/store_recent_orders.dart';
// import 'package:my_pet/app_versions/store/items/data/models/items_model.dart';
// import 'package:my_pet/app_versions/store/items/presentation/screens/add_new_product.dart';
// import 'package:my_pet/app_versions/store/items/presentation/screens/product_details.dart';
// import 'package:my_pet/app_versions/store/order/data/models/order_model.dart';
// import 'package:my_pet/app_versions/store/order/presentation/screens/order_details.dart';
// import 'package:my_pet/app_versions/store/pets/data/models/pets_model.dart';
// import 'package:my_pet/app_versions/store/pets/presentation/screens/add_new_pets.dart';
// import 'package:my_pet/app_versions/store/pets/presentation/screens/pets_details.dart';
// import 'package:my_pet/app_versions/store/profile/presentation/screens/profile_screen.dart';
// import 'package:my_pet/app_versions/store/profile/presentation/widget/edit_profile/edit_profile_screen.dart';
// import 'package:my_pet/app_versions/store/service/data/models/service_model.dart';
// import 'package:my_pet/app_versions/store/service/presentation/cubit/service_cubit.dart';
// import 'package:my_pet/app_versions/store/service/presentation/screens/sub_services.dart';
// import 'package:my_pet/app_versions/store/service/presentation/screens/sub_services_details.dart';
// import 'package:my_pet/core/routing/routes.dart';
// import 'package:my_pet/shared/auth/domain/entities/store.dart';
// import 'package:my_pet/shared/auth/presentation/pages/sing_up_store.dart';

// List<GoRoute> merchantRoutes = [
//   GoRoute(
//     path: AppRouter.storeProductDetails,
//     name: AppRouter.storeProductDetails,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: ProductDetails(product: state.extra as ItemsDetailsEntity),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storeSingUp,
//     name: AppRouter.storeSingUp,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: SignUpStore(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storePetsDetails,
//     name: AppRouter.storePetsDetails,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: PetsDetailsPage(pet: state.extra as PetsDetailsEntity),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storeLayout,
//     name: AppRouter.storeLayout,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: BlocProvider<ProfileStoreCubit>(
//         create: (context) => getIt<ProfileStoreCubit>(),
//         child: StoreActivation(),
//       ),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storeOrderDetails,
//     name: AppRouter.storeOrderDetails,
//     pageBuilder: (context, state) {

//      return CustomTransitionPage(
//         key: state.pageKey,
//         child: StoreOrderDetails(order: state.extra as OrderDetailsEntity),

//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.addNewProduct,
//     name: AppRouter.addNewProduct,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: AddNewProduct(product: state.extra as ItemsDetailsEntity?),

//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.addNewPets,
//     name: AppRouter.addNewPets,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: AddNewPets(pets: state.extra as PetsDetailsEntity?),

//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storeSubServices,
//     name: AppRouter.storeSubServices,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: SubServicesScreen(service: state.extra as ServiceDetailsEntity),

//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storeSubServicesDetails,
//     name: AppRouter.storeSubServicesDetails,
//     pageBuilder: (context, state) {
//       final data = state.extra as Map<String, dynamic>;
//       final subService = data['subService'] as SubServiceEntity;
//       final cubit = data['cubit'] as StoreServiceCubit;
//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: SubServicesDetailsScreen(service: subService, cubit: cubit),

//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   // GoRoute(
//   //   path: AppRouter.clinicStore,
//   //   name: AppRouter.clinicStore,
//   //   pageBuilder: (context, state) => CustomTransitionPage(
//   //     key: state.pageKey,
//   //     child: ClinicStoreScreen(),
//   //
//   //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//   //       return FadeTransition(opacity: animation, child: child);
//   //     },
//   //   ),
//   // ),
//   GoRoute(
//     path: AppRouter.reservationDetails,
//     name: AppRouter.reservationDetails,
//     pageBuilder: (context, state) {
//       final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
//       final bool isEnableExamination = data['isEnableExamination'] as bool;
//       final PetsDetailsEntity pet = data['pet'] as PetsDetailsEntity;

//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: ReservationDetails(
//           pet: pet,
//           isEnableExamination: isEnableExamination,
//         ),

//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.addNewExamination,
//     name: AppRouter.addNewExamination,
//     pageBuilder: (context, state) {
//       final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
//       final PetsDetailsEntity pet = data['pet'] as PetsDetailsEntity;
//       final ClinicStoreCubit cubit = data['cubit'] as ClinicStoreCubit;
//        return CustomTransitionPage(
//         key: state.pageKey,
//         child: AddNewExamination(cubit: cubit, pet: pet),

//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.examinationDetails,
//     name: AppRouter.examinationDetails,
//     pageBuilder: (context, state) {
//       final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
//       final ClinicStoreCubit cubit = data['cubit'] as ClinicStoreCubit;
//       final ExaminationEntity clinic =
//           data['examinationDetails'] as ExaminationEntity;
//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: ExaminationDetails(clinic: clinic, cubit: cubit),

//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.profileStore,
//     name: AppRouter.profileStore,
//     pageBuilder: (context, state) {
//       final extra = state.extra as Map<String, dynamic>? ?? <String, dynamic>{};
//       final StoreEntity store = extra['store'] as StoreEntity;
//       final ProfileStoreCubit cubit = extra['cubit'] as ProfileStoreCubit;
//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: ProfileScreen(store: store, cubit: cubit),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.editProfileInfo,
//     name: AppRouter.editProfileInfo,
//     pageBuilder: (context, state) {
//       final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
//       final StoreEntity store = data['store'] as StoreEntity;
//       final ProfileStoreCubit cubit = data['cubit'] as ProfileStoreCubit;
//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: EditProfileScreen(store: store, cubit: cubit),

//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.qrScannerPage,
//     name: AppRouter.qrScannerPage,
//     pageBuilder: (context, state) {
//       final Map<String, dynamic>? data =
//           state.extra as Map<String, dynamic>?;
//       final bool showDetails =
//           data == null ? true : (data['showDetails'] as bool? ?? true);
//       final ClinicStoreCubit cubit = data?['cubit'] as ClinicStoreCubit;
//       final String reservationId = data?['reservationId'] as String;
//       final String petCode = data?['petCode'] as String;

//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: BlocProvider<ClinicStoreCubit>.value(
//           value: cubit,
//           child: QrScannerPage(
//               cubit: cubit,
//               reservationId: reservationId,
//               petCode: petCode,
//             showDetails:showDetails),
//         ),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.storeReview,
//     name: AppRouter.storeReview,
//     pageBuilder: (context, state) {
//       final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
//       final num avgRate = data['avgRate'] as num;
//       final num countRate = data['countRate'] as num;
//       final String? item = data['item'] as String?;
//       final String? store = data['store'] as String?;
//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: ReviewsPage(
//           avgRate: avgRate,
//           countRate: countRate,
//           item: item,
//           store: store,
//         ),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: animation, child: child);
//         },
//       );
//     },
//   ),
//   GoRoute(
//     path: AppRouter.storeNotification,
//     name: AppRouter.storeNotification,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: const StoreNotificationPage(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
//   GoRoute(
//     path: AppRouter.storeRecentOrders,
//     name: AppRouter.storeRecentOrders,
//     pageBuilder: (context, state) => CustomTransitionPage(
//       key: state.pageKey,
//       child: StoreRecentOrders(),

//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     ),
//   ),
// ];
