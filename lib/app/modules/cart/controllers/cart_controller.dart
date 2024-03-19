import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shopping/app/networks/network_model/res/customer_display_cart.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  var quantity = <int>[].obs;

  RxDouble totalPrice = 0.0.obs;

  final StreamController<CustomerDisplayCartRes?> _fetchCustomerCartDisplay =
      StreamController<CustomerDisplayCartRes?>.broadcast();

  Stream<CustomerDisplayCartRes?> get fetchCustomerCartDisplay =>
      _fetchCustomerCartDisplay.stream;

  @override
  void onInit() {
    quantity.value = List<int>.filled(cartItems.length, 1);
    fetchCustomerCartDisplayAll();

    super.onInit();
  }

  void increaseItemQuantity(int index) {
    if (cartItems.isNotEmpty && index < cartItems.length) {
      quantity[index]++;
      cartItems.refresh(); // Update the UI
    }
  }

  void decreaseItemQuantity(int index) {
    if (cartItems.isNotEmpty &&
        index < cartItems.length &&
        quantity[index] > 1) {
      quantity[index]--;
      cartItems.refresh(); // Update the UI
    }
  }

  void buyNow() {
    // Implement buy now logic here
  }

  Future fetchCustomerCartDisplayAll() async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.displayCart();
    totalPrice.value = 0.0;
    _fetchCustomerCartDisplay.add(response);
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
