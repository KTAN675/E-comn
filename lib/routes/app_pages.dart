import 'package:get/get.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
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
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    //
    // GetPage(
    //   name: AppRoutes.dashboard,
    //   page: () => DashboardView(),
    //   binding: DashboardBinding(),
    // ),
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