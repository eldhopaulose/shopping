import 'dart:async';

import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_name.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_res.dart';
import 'package:shopping/app/networks/repo/auth_repo.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class HomeController extends GetxController {
  var favorites = <int>[];

  final selectedCategory = ''.obs;

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }

  final StreamController<CustomerProductRes?> _fetchCustomerProductByCat =
      StreamController<CustomerProductRes?>.broadcast();

  Stream<CustomerProductRes?> get fetchCustomerProductByCat =>
      _fetchCustomerProductByCat.stream;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCustomerProductByCatc('');
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

  Future<CustomerGetNameRes?> featchName() async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();
    return response;
  }

  Future fetchCustomerProductByCatc(cat) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerProductByCatcories(cat);

    _fetchCustomerProductByCat.add(response!);
  }
}
