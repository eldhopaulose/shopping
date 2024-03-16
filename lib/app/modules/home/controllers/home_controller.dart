import 'dart:async';

import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_name.dart';
import 'package:shopping/app/networks/network_model/res/customer_like_display.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_res.dart';
import 'package:shopping/app/networks/repo/auth_repo.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class HomeController extends GetxController {
  final selectedCategory = ''.obs;

  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
  }

  final StreamController<CustomerProductRes?> _fetchCustomerProductByCat =
      StreamController<CustomerProductRes?>.broadcast();

  Stream<CustomerProductRes?> get fetchCustomerProductByCat =>
      _fetchCustomerProductByCat.stream;

  final StreamController<CustomerProductLikeDisplayRes?>
      _fetchCustomerProductBLiked =
      StreamController<CustomerProductLikeDisplayRes?>.broadcast();

  Stream<CustomerProductLikeDisplayRes?> get fetchCustomerProductLikede =>
      _fetchCustomerProductBLiked.stream;

  @override
  void onInit() {
    super.onInit();

    fetchCustomerProductByCatc('');

    fetchCustomerProductLiked();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCustomerProductByCatc('');
  }

  @override
  void onClose() {
    super.onClose();
    _fetchCustomerProductByCat.close();
  }

  Future<CustomerGetNameRes?> featchName() async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();

    return response;
  }

  Future fetchCustomerProductByCatc(cat) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerProductByCatcories(cat);
    await fetchCustomerProductLiked();
    _fetchCustomerProductByCat.add(response!);
  }

  onlikeProduct(String productId) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    await repo.likeProduct(productId);
    if (selectedCategory.value != 'All') {
      fetchCustomerProductByCatc(selectedCategory.value);
      update();
    } else {
      fetchCustomerProductByCatc('');
      update();
    }
  }

  onUnlikeClick(String Id) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.unlikeProduct(Id);
    if (selectedCategory.value != 'All') {
      fetchCustomerProductByCatc(selectedCategory.value);
      update();
    } else {
      fetchCustomerProductByCatc('');
      update();
    }
  }

  Future fetchCustomerProductLiked() async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerProductLikeDisplay();

    _fetchCustomerProductBLiked.add(response!);
    update();
  }
}
