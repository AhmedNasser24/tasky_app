// import 'dart:io';


// final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// // Animation Types Enum
// enum AnimationType {
//   fade,
//   slide,
//   scale,
//   rotation,
//   slideFromBottom,
//   slideFromTop,
//   slideFromLeft,
//   slideFromRight,
//   cupertino,
// }

// // Custom Page Builder with Animation Support
// Page<T> buildAnimatedPage<T extends Object?>({
//   required Widget child,
//   required LocalKey key,
//   AnimationType animationType = AnimationType.fade,
//   Duration duration = const Duration(milliseconds: 300),
//   Curve curve = Curves.easeInOut,
// }) {
//   // Use Cupertino page for iOS
//   if (Platform.isIOS && animationType == AnimationType.cupertino) {
//     return CupertinoPage<T>(key: key, child: child);
//   }

//   return CustomTransitionPage<T>(
//     key: key,
//     child: child,
//     transitionDuration: duration,
//     reverseTransitionDuration: duration,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return _getAnimationTransition(
//         animationType,
//         animation,
//         secondaryAnimation,
//         child,
//         curve,
//       );
//     },
//   );
// }

// // Animation Builder Function
// Widget _getAnimationTransition(
//   AnimationType type,
//   Animation<double> animation,
//   Animation<double> secondaryAnimation,
//   Widget child,
//   Curve curve,
// ) {
//   final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

//   switch (type) {
//     case AnimationType.fade:
//       return FadeTransition(opacity: curvedAnimation, child: child);

//     case AnimationType.slide:
//     case AnimationType.slideFromRight:
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(1.0, 0.0),
//           end: Offset.zero,
//         ).animate(curvedAnimation),
//         child: child,
//       );

//     case AnimationType.slideFromLeft:
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(-1.0, 0.0),
//           end: Offset.zero,
//         ).animate(curvedAnimation),
//         child: child,
//       );

//     case AnimationType.slideFromBottom:
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0.0, 1.0),
//           end: Offset.zero,
//         ).animate(curvedAnimation),
//         child: child,
//       );

//     case AnimationType.slideFromTop:
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0.0, -1.0),
//           end: Offset.zero,
//         ).animate(curvedAnimation),
//         child: child,
//       );

//     case AnimationType.scale:
//       return ScaleTransition(
//         scale: curvedAnimation,
//         child: FadeTransition(opacity: curvedAnimation, child: child),
//       );

//     case AnimationType.rotation:
//       return RotationTransition(
//         turns: curvedAnimation,
//         child: FadeTransition(opacity: curvedAnimation, child: child),
//       );

//     case AnimationType.cupertino:
//       return FadeTransition(opacity: curvedAnimation, child: child);
//   }
// }

// // Enhanced Custom Transition Page
// class CustomTransitionPage<T> extends Page<T> {
//   const CustomTransitionPage({
//     required this.child,
//     this.transitionDuration = const Duration(milliseconds: 300),
//     this.reverseTransitionDuration = const Duration(milliseconds: 300),
//     this.transitionsBuilder,
//     super.key,
//     super.name,
//     super.arguments,
//     super.restorationId,
//   });

//   final Widget child;
//   final Duration transitionDuration;
//   final Duration reverseTransitionDuration;
//   final RouteTransitionsBuilder? transitionsBuilder;

//   @override
//   Route<T> createRoute(BuildContext context) {
//     return _PageBasedPageRoute<T>(
//       page: this,
//       transitionsBuilder: transitionsBuilder,
//     );
//   }
// }

// class _PageBasedPageRoute<T> extends PageRoute<T> {
//   _PageBasedPageRoute({
//     required CustomTransitionPage<T> page,
//     this.transitionsBuilder,
//   }) : super(settings: page);

//   CustomTransitionPage<T> get _page => settings as CustomTransitionPage<T>;
//   final RouteTransitionsBuilder? transitionsBuilder;

//   @override
//   bool get barrierDismissible => false;

//   @override
//   Color? get barrierColor => null;

//   @override
//   String? get barrierLabel => null;

//   @override
//   Duration get transitionDuration => _page.transitionDuration;

//   @override
//   Duration get reverseTransitionDuration => _page.reverseTransitionDuration;

//   @override
//   bool get maintainState => true;

//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     return _page.child;
//   }

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return transitionsBuilder?.call(
//           context,
//           animation,
//           secondaryAnimation,
//           child,
//         ) ??
//         FadeTransition(opacity: animation, child: child);
//   }
// }

// final GoRouter appRouter = GoRouter(
//   observers: [routeObserver],
//   initialLocation:
//       AppSharedPreferences.getString(key: AppConstants.accessToken) != null
//       ? getRoleEnum() == RoleEnum.user
//             ? AppRouter.customerAppLayout
//             : AppRouter.storeLayout
//       : getRoleEnum() == null
//       ? AppRouter.roleSelection
//       : AppRouter.login,
//   routes: [
//     GoRoute(
//       path: AppRouter.roleSelection,
//       name: AppRouter.roleSelection,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const RoleSelectionPage(),
//         animationType: AnimationType.scale,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.elasticOut,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.login,
//       name: AppRouter.login,
//       redirect: (context, state) {
//         if (getRoleEnum() == null) {
//           return AppRouter.roleSelection;
//         }
//         return null;
//       },
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: LoginPage(roleEnum: getRoleEnum() ?? RoleEnum.user),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.forgetPassword,
//       name: AppRouter.forgetPassword,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: ForgetPassPage(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.signUp,
//       name: AppRouter.signUp,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: SignUp(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.termsAndConditions,
//       name: AppRouter.termsAndConditions,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: TermsAndConditions(isStore: state.extra as bool? ?? false),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerAppLayout,
//       name: AppRouter.customerAppLayout,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CustomerAppLayout(),
//         animationType: AnimationType.fade,
//         duration: const Duration(milliseconds: 500),
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerStorePageDetails,
//       name: AppRouter.customerStorePageDetails,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>?;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: CustomerStorePageDetails(
//             enableBooking: args?['enableBooking'] ?? false,
//             model: args?['model'] as CustomerStoreModel?,
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.customerReviewStoreScreen,
//       name: AppRouter.customerReviewStoreScreen,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CustomerStoreReviewScreen(param: state.extra as ReviewPassParam),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.addReviewScreen,
//       name: AppRouter.addReviewScreen,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: AddReviewPage(reviewParam: state.extra as ReviewPassParam),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerSearchScreen,
//       name: AppRouter.customerSearchScreen,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CustomerSearchScreen(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromTop,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerProductDetails,
//       name: AppRouter.customerProductDetails,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CustomerProductDetailsPage(
//           model: state.extra as CustomerProductModel?,
//         ),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerAnimalDetails,
//       name: AppRouter.customerAnimalDetails,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CustomerAnimalDetailsScreen(
//           petModel: state.extra as CustomerPetModel?,
//         ),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.cartPage,
//       name: AppRouter.cartPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CartPage(),
//         animationType: AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.checkoutPage,
//       name: AppRouter.checkoutPage,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: CheckOutPage(
//             products: args['products'] as List<CustomerProductModel>,
//             pets: args['pets'] as List<CustomerPetModel>,
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.confirmCreateOrder,
//       name: AppRouter.confirmCreateOrder,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: ConfirmCreateOrder(cubit: state.extra as CheckOutCubit),
//         animationType: AnimationType.scale,
//         curve: Curves.elasticOut,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.myAnimals,
//       name: AppRouter.myAnimals,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: MyAnimalsPage(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.addNewAnimal,
//       name: AppRouter.addNewAnimal,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: AddOrUpdateAnimalPage(
//             cubit: args['cubit'] as MyAnimalCubit,
//             petModel: args['petModel'] as CustomerPetModel?,
//           ),
//           animationType: AnimationType.slideFromBottom,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.servicePage,
//       name: AppRouter.servicePage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: ServicesPage(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.serviceListDetails,
//       name: AppRouter.serviceListDetails,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: ServicePageList(
//             model: args['model'] as CustomerServiceModel,
//             cubit: args['cubit'],
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.customerProfile,
//       name: AppRouter.customerProfile,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: CustomerProfilePageView(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerProfileEdit,
//       name: AppRouter.customerProfileEdit,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: PersonalProfilePage(
//             model: args['model'] as UserProfileModel,
//             cubit: args['cubit'] as CustomerProfileCubit,
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.usageConditionPage,
//       name: AppRouter.usageConditionPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const UsageConditionPage(),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.cutomerOrders,
//       name: AppRouter.cutomerOrders,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const MyOrdersScreen(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.singleOrderPage,
//       name: AppRouter.singleOrderPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: SingleOrderPageView(model: state.extra as CustomerOrderModel),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.singleAnimalViewPage,
//       name: AppRouter.singleAnimalViewPage,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: SingleAnimalView(
//             cubit: args['cubit'] as MyAnimalCubit,
//             petModel: args['petModel'] as CustomerPetModel,
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.customerClinics,
//       name: AppRouter.customerClinics,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: ClinicPageView(initalIndex: state.extra as int? ?? 0),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.bookingAppointmentPage,
//       name: AppRouter.bookingAppointmentPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: BookingAppointmentPage(model: state.extra as CustomerStoreModel),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.visitDetailsPage,
//       name: AppRouter.visitDetailsPage,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: VisitDetailsPage(
//             cubit: args['cubit'] as CustomerPetHistoryCubit,
//             id: args['id'] as String,
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.animalVisitingDetails,
//       name: AppRouter.animalVisitingDetails,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: AnimalInVisitPageDetailsView(
//           petModel: state.extra as CustomerPetModel?,
//         ),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.animalsForSale,
//       name: AppRouter.animalsForSale,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const AnimalForSellPage(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.missingAnimalsPageView,
//       name: AppRouter.missingAnimalsPageView,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const MissingAnimalsPageView(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.missingAnimalDetailsView,
//       name: AppRouter.missingAnimalDetailsView,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: MissingAnimalDetailsView(
//           petModel: state.extra as CustomerPetModel?,
//         ),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.changePasswordPage,
//       name: AppRouter.changePasswordPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const ChangePasswordPage(),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.myLocationsManagement,
//       name: AppRouter.myLocationsManagement,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const LocationsListManagement(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.addNewLocation,
//       name: AppRouter.addNewLocation,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const AddNewLocationPage(),
//         animationType: AnimationType.slideFromBottom,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.settingView,
//       name: AppRouter.settingView,
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         return buildAnimatedPage(
//           key: state.pageKey,
//           child: SettingPageView(
//             model: args['model'] as UserProfileModel,
//             cubit: args['cubit'] as CustomerProfileCubit,
//           ),
//           animationType: Platform.isIOS
//               ? AnimationType.cupertino
//               : AnimationType.slideFromRight,
//         );
//       },
//     ),

//     GoRoute(
//       path: AppRouter.paymentMethod,
//       name: AppRouter.paymentMethod,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const PaymentMethodManagement(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.faqPageView,
//       name: AppRouter.faqPageView,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const FaqPageView(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.contactUsPage,
//       name: AppRouter.contactUsPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const ContactUsPageView(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromRight,
//       ),
//     ),

//     GoRoute(
//       path: AppRouter.customerNotificationPage,
//       name: AppRouter.customerNotificationPage,
//       pageBuilder: (context, state) => buildAnimatedPage(
//         key: state.pageKey,
//         child: const CustomerNotificationPage(),
//         animationType: Platform.isIOS
//             ? AnimationType.cupertino
//             : AnimationType.slideFromTop,
//       ),
//     ),

//     ...merchantRoutes,
//   ],
// );

// RoleEnum? getRoleEnum() {
//   final value = AppSharedPreferences.getString(key: AppConstants.roleName);
//   if (value == null) return null;
//   RoleEnum? role = RoleEnum.values.byName(
//     AppSharedPreferences.getString(key: AppConstants.roleName) ?? "user",
//   );
//   return role;
// }
