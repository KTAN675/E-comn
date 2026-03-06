//import 'package:e_comm/modules/profile_and_setting/profile_and_setting_view.dart';
import 'package:get/get.dart';
//import '../modules/add_balance/add_balance_binding.dart';
//import '../modules/add_balance/add_balance_view.dart';
import '../exchange/exchange_binding.dart';
import '../exchange/exchange_view.dart';
import '../modules/address/address_controller.dart';
import '../modules/address/address_view.dart';
import '../modules/address/widgets/map_location_view.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/sign_up/sign_up_binding.dart';
import '../modules/auth/sign_up/sign_up_view.dart';
import '../modules/cart/cart_binding.dart';
import '../modules/cart/cart_view.dart';
import '../modules/category/category_binding.dart';
import '../modules/category/category_view.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/drawer/drawer_binding.dart';
import '../modules/drawer/drawer_view.dart';
import '../modules/mian_shell/main_shell_binding.dart';
import '../modules/mian_shell/main_shell_view.dart';
import '../modules/orders/order_detail_binding.dart';
import '../modules/orders/orders_binding.dart';
import '../modules/orders/orders_detail_view.dart';
import '../modules/orders/orders_view.dart';
import '../modules/products/product_detail/product_detail_binding.dart';
import '../modules/products/product_detail/product_detail_view.dart';
import '../modules/products/product_listing_binding.dart';
import '../modules/products/product_listing_view.dart';
import '../modules/profile/Help & FAQs/help_faqs_binding.dart';
import '../modules/profile/Help & FAQs/help_faqs_view.dart';
import '../modules/profile/add_balance/add_balance_binding.dart';
import '../modules/profile/add_balance/add_balance_view.dart';
//import '../modules/profile_and_setting/widgets/edit_profile_view.dart';
import '../modules/location_premission/location_permission_binding.dart';
import '../modules/location_premission/location_permission_view.dart';
//import '../modules/notification/notification_binding.dart';
//import '../modules/notification/notification_view.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';
//import '../modules/profile_and_setting/profile_and_setting_binding.dart';
import '../modules/profile/notification/notification_binding.dart';
import '../modules/profile/notification/notification_view.dart';
import '../modules/profile/profile_and_setting/profile_and_setting_binding.dart';
import '../modules/profile/profile_and_setting/profile_and_setting_view.dart';
import '../modules/profile/profile_and_setting/widgets/edit_profile_view.dart';
//import '../modules/profile/rewards/past_orders_binding.dart';
//import '../modules/profile/rewards/past_orders_view.dart';
import '../modules/profile/rewards/rewards_binding.dart';
import '../modules/profile/rewards/rewards_view.dart';
import '../modules/profile/select_payment/select_binding.dart';
import '../modules/profile/select_payment/select_view.dart';
import '../modules/profile/subscription/subscription_binding.dart';
import '../modules/profile/subscription/subscription_view.dart';
import '../modules/profile/wallet/wallet_binding.dart';
import '../modules/profile/wallet/wallet_view.dart';
import '../modules/profile/withdraw/withdraw_binding.dart';
import '../modules/profile/withdraw/withdraw_view.dart';
import '../modules/return/return_binding.dart';
import '../modules/return/return_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/vendor_categories/vendor_categories_binding.dart';
import '../modules/vendor_categories/vendor_categories_view.dart';
import '../modules/wishlist/wishlist_binding.dart';
import '../modules/wishlist/wishlist_view.dart';
import '../openTerms/open_terms_binding.dart';
import '../openTerms/open_terms_view.dart';
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
    GetPage(
      name: AppRoutes.categories,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),

    GetPage(
      name: AppRoutes.mainShell,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.vendorCategories,
      page: () => const VendorCategoriesView(),
      binding: VendorCategoriesBinding(),
    ),

    GetPage(
      name: AppRoutes.productListing,
      page: () => const ProductListingView(),
      binding: ProductListingBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    //
    GetPage(
      name: AppRoutes.address,
      page: () => const AddressView(),
      binding: BindingsBuilder(() {
        Get.put(AddressController());
      }),
    ),

    GetPage(
      name: AppRoutes.mapLocation,
      page: () => const MapLocationView(),
    ),

    GetPage(
      name: AppRoutes.orders,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    )

    ,GetPage(
      name: AppRoutes.ordersDetail,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
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
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),

    GetPage(
      name: AppRoutes.wallet,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),

    GetPage(
      name: AppRoutes.add_balance,
      page: () =>  AddBalanceView(),
      binding: AddBalanceBinding(),
    ),

    GetPage(
      name: AppRoutes.withdraw,
      page: () =>  WithdrawView(),
      binding: WithdrawBinding(),
    ),

    GetPage(
      name: AppRoutes.subscription,
      page: () =>  SubscriptionView(),
      binding: SubscriptionBinding(),
    ),

    GetPage(
      name: AppRoutes.select_payment,
      page: () =>  SelectView(),
      binding: SelectBinding(),
    ),

    GetPage(
      name: AppRoutes.rewards,
      page: () =>  RewardsView(),
      binding: RewardsBinding(),
    ),

    GetPage(
      name: AppRoutes.returns,
      page: () =>  ReturnView(),
      binding: ReturnBinding(),
    ),

    GetPage(
      name: AppRoutes.exchange,
      page: () =>  ExchangeView(),
      binding: ExchangeBinding(),
    ),

    GetPage(
      name: AppRoutes.drawer,
      page: () => const DrawerView(),
      binding: DrawerBinding(),
    ),

    GetPage(
      name: AppRoutes.help_and_faqs,
      page: () => const HelpFaqsView(),
      binding: HelpFaqsBinding(),
    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: ProfileAndSettingBinding(),
    ),

    GetPage(
      name: AppRoutes.openTerms,
      page: () => const OpenTermsView(),
      binding: OpenTermsBinding(),
    ),

    GetPage(
      name: AppRoutes.ProfileAndSetting,
      page: () => const ProfileAndSettingView(),
      binding: ProfileAndSettingBinding(),
    ),

    GetPage(
      name: AppRoutes.wishlist,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    //
    // GetPage(
    //   name: AppRoutes.productDetails,
    //   page: () => ProductView(),
    //   binding: ProductBinding(),
    // ),
    //
     GetPage(
     name: AppRoutes.cart,
       page: () => CartView(),
       binding: CartBinding(),
     ),
    //
     //GetPage(
       //name: AppRoutes.checkout,
       //page: () => CheckoutView(),
       //binding: CheckoutBinding(),
     //),
    //
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => ProfileView(),
    //   binding: ProfileBinding(),
    // ),
  ];
}