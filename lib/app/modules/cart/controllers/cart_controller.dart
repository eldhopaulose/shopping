import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

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
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({required this.id, required this.title, required this.quantity, required this.price});
}
