import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping/app/modules/cart/controllers/cart_controller.dart';
import 'package:shopping/app/networks/network_model/req/booking_req.dart';
import 'package:shopping/app/networks/network_model/req/customer_add_cart.dart';
import 'package:shopping/app/networks/network_model/res/booking_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_single_product.dart';
import 'package:shopping/app/networks/repo/auth_repo.dart';
import 'package:shopping/app/networks/repo/booking_repo.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class DetailsController extends GetxController {
  final CartController cartController = Get.put(CartController());
  final arg = Get.arguments;

  late String buyPrice;

  String formattedDate =
      DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  Razorpay _razorpay = Razorpay();

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

  Future<BookingRes?> onDetailBooking(price) async {
    final BookingRepo repo = BookingRepo();
    final CustomerProductRepo repoPro = CustomerProductRepo();
    final responseAdd = await repoPro.getCustomerAdress();

    final AuthRepo repoUser = AuthRepo();
    final responseUser = await repoUser.getUserDetails();

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

      product: [arg],
      totalAmount: int.parse(price.toString()),
      userId: responseUser!.name as String,
    ));
    if (response != null) {
      Get.snackbar("Success", "Product booked successfully");
    } else {
      Get.snackbar("Error", "Product not booked");
    }
    return response;
  }

  buyNow(price) async {
    print("Price: $price");
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();

    var options = {
      'key': 'rzp_test_L6O15RueQQYPaH',
      'amount': price * 100, // Convert to integer
      'name': 'Nosta',
      'description': 'Cart Payment',
      'prefill': {'email': response!.email, 'name': response.name},
      'external': {
        'wallets': ['paytm'],
      }
    };

    buyPrice = price.toString();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("Success", "Payment Successful");
    onDetailBooking(buyPrice);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Error", "Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("Error", "Payment Failed");
  }
}
