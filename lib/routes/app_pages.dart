import 'package:get/get.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/sign_up/sign_up_binding.dart';
import '../modules/auth/sign_up/sign_up_view.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/location_premission/location_permission_binding.dart';
import '../modules/location_premission/location_permission_view.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';


import 'app_routes.dart';

class AppPages {
  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    //
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    //
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.locationPermission,
      page: () => const LocationPermissionView(),
      binding: LocationPermissionBinding(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    //
    // GetPage(
    //   name: AppRoutes.productDetails,
    //   page: () => ProductView(),
    //   binding: ProductBinding(),
    // ),
    //
    // GetPage(
    //   name: AppRoutes.cart,
    //   page: () => CartView(),
    //   binding: CartBinding(),
    // ),
    //
    // GetPage(
    //   name: AppRoutes.checkout,
    //   page: () => CheckoutView(),
    //   binding: CheckoutBinding(),
    // ),
    //
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => ProfileView(),
    //   binding: ProfileBinding(),
    // ),
  ];
}