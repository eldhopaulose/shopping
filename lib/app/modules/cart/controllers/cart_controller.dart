import 'dart:async';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping/app/networks/network_model/req/booking_req.dart';
import 'package:shopping/app/networks/network_model/res/booking_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_display_cart.dart';
import 'package:shopping/app/networks/network_model/res/customer_display_cart.dart'
    as CartRes;
import 'package:shopping/app/networks/repo/auth_repo.dart';
import 'package:shopping/app/networks/repo/booking_repo.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  var quantity = <int>[].obs;
  var cartId = [].obs;
  var address = [].obs;

  String formattedDate =
      DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  Razorpay _razorpay = Razorpay();

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

  @override
  void onClose() {
    _fetchCustomerCartDisplay.close();
    super.onClose();
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

  Future<BookingRes?> onCartBooking() async {
    final BookingRepo repo = BookingRepo();
    final CustomerProductRepo repoPro = CustomerProductRepo();
    final responseAdd = await repoPro.getCustomerAdress();

    final CustomerProductRepo repoCart = CustomerProductRepo();
    final responseCart = await repoCart.displayCart();

    final AuthRepo repoUser = AuthRepo();
    final responseUser = await repoUser.getUserDetails();

    responseCart!.cart!.forEach((element) {
      cartId.addAll([element.sId!]);
    });

    final response = await repo.booking(BookingReq(
      address: [
        responseAdd!.address![0].address! +
            "" +
            responseAdd.address![0].district! +
            "" +
            responseAdd.address![0].state! +
            "" +
            responseAdd.address![0].pinCode! +
            "" +
            responseAdd.address![0].country!,
        responseAdd.address![0].mobileNumber!
      ],
      bookingDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      bookingTime: DateFormat('hh:mm:ss').format(DateTime.now()),

      // ...

      product: cartId.cast<String>(),
      totalAmount: totalPrice.value.toInt(),
      userId: responseUser!.name as String,
    ));
    if (response != null) {
      Get.snackbar("Success", "Product booked successfully");

      fetchCustomerCartDisplayAll();
      cartId.clear();
      address.clear();
    } else {
      Get.snackbar("Error", "Product not booked");
    }
    return response;
  }

  buyNow() async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();

    var options = {
      'key': 'rzp_test_L6O15RueQQYPaH',
      'amount': totalPrice.value * 100,
      'name': 'Nosta',
      'description': 'Cart Payment',
      'prefill': {'email': response!.email, 'name': response.name},
      'external': {
        'wallets': ['paytm'],
      }
    };

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("Success", "Payment Successful");
    onCartBooking();
    cartId.clear();
    address.clear();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Error", "Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("Error", "Payment Failed");
  }
}
