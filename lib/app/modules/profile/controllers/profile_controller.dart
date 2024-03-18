import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/req/customer_adress_create_req.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_adress.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var mobile = ''.obs;
  var address = ''.obs;
  var district = ''.obs;
  var state = ''.obs;
  var pincode = ''.obs;
  var country = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

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

  onAdressClick() {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = repo.createCustomerAdress(CustomerCreateAdressReq(
      name: nameController.text,
      mobileNumber: mobileController.text,
      address: addressController.text,
      district: districtController.text,
      state: stateController.text,
      pinCode: pincodeController.text,
      country: countryController.text,
    ));

    if (response != null) {
      Get.snackbar('Success', 'Address Added Successfully');
    } else {
      Get.snackbar('Error', 'Address Not Added');
    }
  }

  Future<CustomerGetAdressRes?> getAdress() async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerAdress();
    return response;
  }
}
