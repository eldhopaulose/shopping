import 'package:get/get.dart';

class HomeController extends GetxController {
   var favorites = <int>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

 



  bool isFavorite(int productId) {
    return favorites.contains(productId);
  }

  void toggleFavorite(int productId) {
    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
  }


}
