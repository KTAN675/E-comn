import 'package:get/get.dart';
import '../../constant/app_colors.dart';

enum DashboardTheme {
  grocery,
  medicine,
}

class DashboardController extends GetxController {

  // =============================
  // 📌 UI SELECTION STATES
  // =============================

  int selectedCategoryIndex = 0;
  int selectedVendorIndex = -1;

  // =============================
  // 🎨 THEME STATE
  // =============================

  DashboardTheme currentTheme = DashboardTheme.grocery;

  // =============================
  // 🚀 LIFECYCLE
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
  // 🗂 CATEGORY
  // =============================

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  // =============================
  // 🏬 VENDOR
  // =============================

  void changeVendor(int index) {
    selectedVendorIndex = index;
    update();
  }

  // =============================
  // 🔁 THEME TOGGLE
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
  // 🖼 BANNER IMAGE HELPER
  // =============================

  String get bannerImage {
    return currentTheme == DashboardTheme.grocery
        ? "assets/images/banner_grocery.png"
        : "assets/images/banner_medicine.png";
  }

  bool get isGrocery => currentTheme == DashboardTheme.grocery;
}