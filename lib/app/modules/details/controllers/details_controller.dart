import 'package:get/get.dart';
import 'package:shopping/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopping/app/networks/network_model/req/customer_add_cart.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_single_product.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class DetailsController extends GetxController {
  final CartController cartController = Get.put(CartController());

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

  Future<CustomerGetSingleProductRes?> featchSingleProduct(id) {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = repo.getCustomerSingleProduct(id);
    return response;
  }

  onClickCart(id) async {
    try {
      final CustomerProductRepo repo = CustomerProductRepo();
      final response = await repo.addCart(CustomerAddCartReq(productId: id));
      if (response != null) {
        Get.snackbar("Success", "Product added to cart");
        await cartController.fetchCustomerCartDisplayAll();
      } else {
        Get.snackbar("Error", "Product not added to cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Product not added to cart");
    }
  }
}
