import 'package:e_comm/modules/cart/widgets/order_success_dialog.dart';
import 'package:get/get.dart';
import '../../data/models/address/address_model.dart';
import '../../data/models/cart/cart_item_model.dart';
import '../../data/models/payment_method/payment_method_model.dart';
import '../../data/models/product/product_model.dart';

class CartController extends GetxController {

  /// CART ITEMS
  List<CartItemModel> cartItems = [

    CartItemModel(
      id: "1",
      name: "Fresh mahabaleshwar Strawberry",
      subtitle: "150 g",
      image: "assets/images/products/strawberry.png",
      price: 150,
      originalPrice: 250,
    ),

    CartItemModel(
      id: "2",
      name: "Farm fresh Avocado",
      subtitle: "150 g",
      image: "assets/images/products/avocado.png",
      price: 150,
      originalPrice: 250,
    ),

    CartItemModel(
      id: "3",
      name: "Kashmiri red Apples",
      subtitle: "150 g",
      image: "assets/images/products/apple.png",
      price: 150,
      originalPrice: 250,
    ),
  ];

  /// PAYMENT METHOD
  int selectedPaymentIndex = 0;

  /// WALLET
  bool walletEnabled = false;

  /// WALLET BALANCE
  double walletBalance = 300;

  /// ORDER VALUES
  double orderAmount = 30;
  double promo = 3;
  double delivery = 1;
  double tax = 30;

  /// INCREASE QUANTITY
  void increaseQty(int index) {
    cartItems[index].quantity++;
    update();
  }

  /// DECREASE QUANTITY
  void decreaseQty(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      update();
    }
  }

  /// MOVE TO WISHLIST
  void moveToWishlist(int index) {
    cartItems.removeAt(index);
    update();
  }

  /// CHANGE PAYMENT METHOD
  void changePaymentMethod(int index) {
    selectedPaymentIndex = index;
    update();
  }

  /// TOGGLE WALLET
  void toggleWallet() {
    walletEnabled = !walletEnabled;
    update();
  }

  /// TOTAL CALCULATION
  double get totalAmount {
    double total = orderAmount - promo + delivery + tax;

    if (walletEnabled) {
      total -= walletBalance;
    }

    return total < 0 ? 0 : total;
  }

  /// PLACE ORDER
  void placeOrder() {

    Get.dialog(
      OrderSuccessDialog(
        invoiceId: "8srl7sw",
        image: "assets/images/success.png",
      ),
    );
  }

  void addToCart(ProductModel product) {

    final index =
    cartItems.indexWhere((item) => item.id == product.title);

    if (index != -1) {

      /// already in cart → increase qty
      cartItems[index].quantity++;

    } else {

      /// convert product → cart item
      cartItems.add(CartItemModel.fromProduct(product));

    }

    update();
  }

  /// RECOMMENDED PRODUCTS
  List<ProductModel> recommendedProducts = [

    ProductModel(
      title: "Strawberry",
      subtitle: "Mahabaleshwar",
      image: "assets/images/products/strawberry.png",
      weight: "150–200g / pack",
      price: 40.40,
      oldPrice: 50,
      discount: 10,
    ),

    ProductModel(
      title: "Banana",
      subtitle: "Fresh & Sweet",
      image: "assets/images/products/banana.png",
      weight: "100g / pack",
      price: 22.40,
      oldPrice: 32,
      discount: 12,
    ),

    ProductModel(
      title: "Dragon Fruit",
      subtitle: "Exotic Fresh",
      image: "assets/images/products/dragon.png",
      weight: "150–200g / pack",
      price: 35.40,
      oldPrice: 50,
    ),

  ];

  List<PaymentMethodModel> paymentMethods = [

    PaymentMethodModel(
      title: "UPI",
      subtitle: "*********8317",
      image: "assets/images/payment/upi.png",
    ),

    PaymentMethodModel(
      title: "Card",
      subtitle: "dji***@gmail.com",
      image: "assets/images/payment/visa.png",
    ),

    PaymentMethodModel(
      title: "Net Banking",
      image: "assets/images/payment/netbanking.png",
    ),

    PaymentMethodModel(
      title: "Cash on Delivery",
      image: "assets/images/payment/cod.png",
    ),
  ];

  AddressModel selectedAddress = AddressModel(
    title: "Delivery Address",
    addressLine: "12/3 UDD, Road no A3",
    city: "Mumbai - 51", building: '',
  );

}