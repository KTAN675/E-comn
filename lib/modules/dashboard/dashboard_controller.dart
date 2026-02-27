import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../data/models/product/inspriation_model.dart';
import '../../data/models/product/product_model.dart';

enum DashboardTheme {
  grocery,
  medicine,
}

class DashboardController extends GetxController {

  // =============================
  //  UI SELECTION STATES
  // =============================

  int selectedCategoryIndex = 0;
  int selectedVendorIndex = -1;

  // =============================
  // THEME STATE
  // =============================

  DashboardTheme currentTheme = DashboardTheme.grocery;

  // =============================
  // LIFECYCLE
  // =============================

  @override
  void onInit() {
    super.onInit();
    loadDashboard();
  }

  void loadDashboard() {
    // Future: Fetch API data here
    update();
  }

  // =============================
  //  CATEGORY
  // =============================

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  // =============================
  // VENDOR
  // =============================

  void changeVendor(int index) {
    selectedVendorIndex = index;
    update();
  }

  // =============================
  // THEME TOGGLE
  // =============================

  void toggleTheme() {
    if (currentTheme == DashboardTheme.grocery) {
      currentTheme = DashboardTheme.medicine;
      AppColors.setMedicineTheme();
    } else {
      currentTheme = DashboardTheme.grocery;
      AppColors.setGroceryTheme();
    }

    update();
  }

  // =============================
  // BANNER IMAGE HELPER
  // =============================

  String get bannerImage {
    return currentTheme == DashboardTheme.grocery
        ? "assets/images/banner_grocery.png"
        : "assets/images/icons/medical.png";
  }

  bool get isGrocery => currentTheme == DashboardTheme.grocery;


  int selectedTabIndex = 0;

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }


  List<ProductModel> flashProducts = [
    ProductModel(
      title: "Chicken breast frozen",
      image: "assets/images/products/chicken_breast.png",
      weight: "450–500gr /pack",
      price: 22.40,
      oldPrice: 32.00,
      discount: 30,
    ),
    ProductModel(
      title: "Chicken breast frozen",
      image: "assets/images/products/eggs.png",
      weight: "0.9–1kg /pack",
      price: 13.00,
      oldPrice: 20.00,
      discount: 35,
    ),
    ProductModel(
      title: "Beef meat slice",
      image: "assets/images/products/beef.png",
      weight: "450–500gr /pack",
      price: 30.00,
      oldPrice: 38.00,
      discount: 20,
    ),
  ];

  List<ProductModel> todaysSpecials = [
    ProductModel(
      title: "Australia beef terderloin",
      image: "assets/images/products/chicken_breast.png",
      weight: "450–500gr /pack",
      price: 40.00,
      oldPrice: 50.00,
      discount: 20,
    ),
    ProductModel(
      title: "Omega chicken eggs",
      image: "assets/images/products/eggs.png",
      weight: "0.9–1kg /pack",
      price: 15.00,
    ),
    ProductModel(
      title: "Cavendish baby banana",
      image: "assets/images/products/beef.png",
      weight: "450–500gr /pack",
      price: 9.00,
    ),
  ];
  List<InspirationModel> inspirations = [
    InspirationModel(
      title: "Classic spaghetti bolognese",
      image: "assets/images/products/classic_spaghetti.png",
      time: "10 mins",
    ),
    InspirationModel(
      title: "Quick beef rice bowl",
      image: "assets/images/products/quick_beef_rice.png",
      time: "15 mins",
    ),
    InspirationModel(
      title: "Morning healthy salad",
      image: "assets/images/products/morning_salad.png",
      time: "5 mins",
    ),
  ];
}