import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = [].obs;

  void addToWishlist(item) {
    wishlist.add(item);
  }

  void removeFromWishlist(item) {
    wishlist.remove(item);
  }
}

class MyApp extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Myntra App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(() => Text('Wishlist count: ${wishlistController.wishlist.length}')),
              TextButton(
                onPressed: () => wishlistController.addToWishlist('Item 1'),
                child: Text('Add to Wishlist'),
              ),
              TextButton(
                onPressed: () => wishlistController.removeFromWishlist('Item 1'),
                child: Text('Remove from Wishlist'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}