import 'dart:async';

import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/res/customer_display_cart.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  final StreamController<CustomerDisplayCartRes?> _fetchCustomerCartDisplay =
      StreamController<CustomerDisplayCartRes?>.broadcast();

  Stream<CustomerDisplayCartRes?> get fetchCustomerCartDisplay =>
      _fetchCustomerCartDisplay.stream;

  @override
  void onInit() {
    fetchCustomerCartDisplayAll();
    super.onInit();
  }

  void addToCart(CartItem item) {
    cartItems.add(item);
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  void increaseItemQuantity(CartItem item) {
    // Implement increase item quantity logic here
  }

  void decreaseItemQuantity(CartItem item) {
    // Implement decrease item quantity logic here
  }

  void buyNow() {
    // Implement buy now logic here
  }

  double get totalPrice {
    // Calculate total price logic here
    return 0.0; // Placeholder, replace with actual logic
  }

  Future fetchCustomerCartDisplayAll() async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.displayCart();

    _fetchCustomerCartDisplay.add(response!);
    update();
  }

  onCartDelete(String id) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.deleteCart(id);
    if (response != null) {
      Get.snackbar("Success", "Product removed from cart");
      fetchCustomerCartDisplayAll();
    } else {
      Get.snackbar("Error", "Product not removed from cart");
    }
  }
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}
