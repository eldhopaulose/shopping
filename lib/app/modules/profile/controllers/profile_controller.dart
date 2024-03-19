import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/req/customer_adress_create_req.dart';
import 'package:shopping/app/networks/network_model/req/customer_update_req.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_adress.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_name.dart';
import 'package:shopping/app/networks/network_model/res/customer_update_adress.dart';
import 'package:shopping/app/networks/repo/auth_repo.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var mobile = ''.obs;
  var address = ''.obs;
  var district = ''.obs;
  var state = ''.obs;
  var pincode = ''.obs;
  var country = ''.obs;
  var adrressId = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  final StreamController<CustomerGetAdressRes?> _fetchAdress =
      StreamController<CustomerGetAdressRes?>.broadcast();

  Stream<CustomerGetAdressRes?> get fetchAdress => _fetchAdress.stream;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    nameController.text = name.value;
    mobileController.text = mobile.value;
    addressController.text = address.value;
    districtController.text = district.value;
    stateController.text = state.value;
    pincodeController.text = pincode.value;
    countryController.text = country.value;
  }

  @override
  void onReady() {
    super.onReady();
    print(name.value);
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

  Future getAdress() async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerAdress();

    _fetchAdress.add(response!);
    update();
  }

  onClickUpdateAdress(String id) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.updateCustomerAdress(
        CustomerUpdateAdressReq(
          name: nameController.text,
          mobileNumber: mobileController.text,
          address: addressController.text,
          district: districtController.text,
          state: stateController.text,
          pinCode: pincodeController.text,
          country: countryController.text,
        ),
        id);

    if (response != null) {
      Get.snackbar('Success', 'Address Updated Successfully');
    } else {
      Get.snackbar('Error', 'Address Not Updated');
    }
  }

  Future<CustomerGetNameRes?> featchName() async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();

    return response;
  }
}
