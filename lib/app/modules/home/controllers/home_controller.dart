import 'package:get/get.dart';

class HomeController extends GetxController {
   var favorites = <int>[];

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

 



  RxBool isFavorite(int productId) {
    return favorites.contains(productId).obs;
  }

  

 void toggleFavorite(int productId) {
  print(productId);
  if (favorites.contains(productId)) {
    favorites.remove(productId);
  } else {
    favorites.add(productId);
  }
}



}
