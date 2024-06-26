import 'package:dio/dio.dart';
import 'package:shopping/app/networks/dio_client.dart';
import 'package:shopping/app/networks/endpoints.dart';
import 'package:shopping/app/networks/network_model/req/customer_add_cart.dart';
import 'package:shopping/app/networks/network_model/req/customer_adress_create_req.dart';
import 'package:shopping/app/networks/network_model/req/customer_update_req.dart';
import 'package:shopping/app/networks/network_model/res/customer_add_cart_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_cart_delete.dart';
import 'package:shopping/app/networks/network_model/res/customer_create_adress_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_display_cart.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_adress.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_single_product.dart';
import 'package:shopping/app/networks/network_model/res/customer_like_display.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_like.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_unlike.dart';
import 'package:shopping/app/networks/network_model/res/customer_update_adress.dart';
import 'package:shopping/app/networks/network_model/res/liked_all_data_res.dart';

class CustomerProductRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<CustomerProductRes?> getCustomerProductByCatcories(String cat) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerProductbycat,
        queryParameters: cat,
      );
      if (response.statusCode == 200) {
        final customerProductResponse =
            CustomerProductRes.fromJson(response.data);
        if (customerProductResponse.products != null) {
          return customerProductResponse;
        } else {
          final customerProductResponse =
              CustomerProductRes(error: "No Product Found");
          return customerProductResponse;
        }
      } else {
        final customerProductResponse =
            CustomerProductRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerProductResponse;
        } else {
          return CustomerProductRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerProductRes(error: "Unexpected Error");
    }
  }

  Future<CustomerProductLikeRes?> likeProduct(String productId) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerProductLike,
        queryParameters: productId,
      );
      if (response.statusCode == 200) {
        final customerProductLikeResponse =
            CustomerProductLikeRes.fromJson(response.data);
        if (customerProductLikeResponse.likedProduct != null) {
          return customerProductLikeResponse;
        } else {
          final customerProductLikeResponse =
              CustomerProductLikeRes(error: "No Product Found");
          return customerProductLikeResponse;
        }
      } else {
        final customerProductLikeResponse =
            CustomerProductLikeRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerProductLikeResponse;
        } else {
          return CustomerProductLikeRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerProductLikeRes(error: "Unexpected Error");
    }
  }

  Future<CustomerProductUnlikeRes?> unlikeProduct(String productId) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerProductUnlike,
        queryParameters: productId,
      );
      if (response.statusCode == 200) {
        final customerProductUnlikeResponse =
            CustomerProductUnlikeRes.fromJson(response.data);
        if (customerProductUnlikeResponse.message != null) {
          return customerProductUnlikeResponse;
        } else {
          final customerProductUnlikeResponse =
              CustomerProductUnlikeRes(error: "No Product Found");
          return customerProductUnlikeResponse;
        }
      } else {
        final customerProductUnlikeResponse =
            CustomerProductUnlikeRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerProductUnlikeResponse;
        } else {
          return CustomerProductUnlikeRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerProductUnlikeRes(error: "Unexpected Error");
    }
  }

  Future<CustomerProductLikeDisplayRes?> getCustomerProductLikeDisplay() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerProductLikeDisplay,
      );
      if (response.statusCode == 200) {
        final customerProductLikeDisplayResponse =
            CustomerProductLikeDisplayRes.fromJson(response.data);
        if (customerProductLikeDisplayResponse.likedProducts != null) {
          return customerProductLikeDisplayResponse;
        } else {
          final customerProductLikeDisplayResponse =
              CustomerProductLikeDisplayRes(error: "No Product Found");
          return customerProductLikeDisplayResponse;
        }
      } else {
        final customerProductLikeDisplayResponse =
            CustomerProductLikeDisplayRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerProductLikeDisplayResponse;
        } else {
          return CustomerProductLikeDisplayRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerProductLikeDisplayRes(error: "Unexpected Error");
    }
  }

  Future<CustomerProductLikeDisplayAllRes?>
      getCustomerProductLikeDisplayAll() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerProductLikeDisplayAll,
      );
      if (response.statusCode == 200) {
        final customerProductLikeDisplayAllResponse =
            CustomerProductLikeDisplayAllRes.fromJson(response.data);
        if (customerProductLikeDisplayAllResponse.likedProducts != null) {
          return customerProductLikeDisplayAllResponse;
        } else {
          final customerProductLikeDisplayAllResponse =
              CustomerProductLikeDisplayAllRes(error: "No Product Found");
          return customerProductLikeDisplayAllResponse;
        }
      } else {
        final customerProductLikeDisplayAllResponse =
            CustomerProductLikeDisplayAllRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerProductLikeDisplayAllResponse;
        } else {
          return CustomerProductLikeDisplayAllRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerProductLikeDisplayAllRes(error: "Unexpected Error");
    }
  }

  Future<CustomerGetSingleProductRes?> getCustomerSingleProduct(
      String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerGetSingleProduct,
        queryParameters: id,
      );
      if (response.statusCode == 200) {
        final customerGetSingleProductResponse =
            CustomerGetSingleProductRes.fromJson(response.data);
        if (customerGetSingleProductResponse.product != null) {
          return customerGetSingleProductResponse;
        } else {
          final customerGetSingleProductResponse =
              CustomerGetSingleProductRes(error: "No Product Found");
          return customerGetSingleProductResponse;
        }
      } else {
        final customerGetSingleProductResponse =
            CustomerGetSingleProductRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerGetSingleProductResponse;
        } else {
          return CustomerGetSingleProductRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerGetSingleProductRes(error: "Unexpected Error");
    }
  }

  Future<CustomerCreateAdressRes?> createCustomerAdress(
      CustomerCreateAdressReq customerCreateAdressReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerCreateAdress,
        data: customerCreateAdressReq.toJson(),
      );
      if (response.statusCode == 200) {
        final customerCreateAdressResponse =
            CustomerCreateAdressRes.fromJson(response.data);
        if (customerCreateAdressResponse.newAddress != null) {
          return customerCreateAdressResponse;
        } else {
          final customerCreateAdressResponse =
              CustomerCreateAdressRes(error: "No Product Found");
          return customerCreateAdressResponse;
        }
      } else {
        final customerCreateAdressResponse =
            CustomerCreateAdressRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerCreateAdressResponse;
        } else {
          return CustomerCreateAdressRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerCreateAdressRes(error: "Unexpected Error");
    }
  }

  Future<CustomerGetAdressRes?> getCustomerAdress() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerGetAdress,
      );
      if (response.statusCode == 200) {
        final customerGetAdressResponse =
            CustomerGetAdressRes.fromJson(response.data);
        if (customerGetAdressResponse.address != null) {
          return customerGetAdressResponse;
        } else {
          final customerGetAdressResponse =
              CustomerGetAdressRes(error: "No Product Found");
          return customerGetAdressResponse;
        }
      } else {
        final customerGetAdressResponse =
            CustomerGetAdressRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerGetAdressResponse;
        } else {
          return CustomerGetAdressRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerGetAdressRes(error: "Unexpected Error");
    }
  }

  Future<CustomerUpdateAdressRes?> updateCustomerAdress(
      CustomerUpdateAdressReq customerUpdateAdressReq, String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerUpdateAdress,
        data: customerUpdateAdressReq.toJson(),
        queryParameters: id,
      );
      if (response.statusCode == 200) {
        final customerGetAdressResponse =
            CustomerUpdateAdressRes.fromJson(response.data);
        if (customerGetAdressResponse.updatedAddress != null) {
          return customerGetAdressResponse;
        } else {
          final customerGetAdressResponse =
              CustomerUpdateAdressRes(error: "No Product Found");
          return customerGetAdressResponse;
        }
      } else {
        final customerGetAdressResponse =
            CustomerUpdateAdressRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerGetAdressResponse;
        } else {
          return CustomerUpdateAdressRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerUpdateAdressRes(error: "Unexpected Error");
    }
  }

  Future<CustomerAddCartRes?> addCart(
      CustomerAddCartReq customerAddCartReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerAddCart,
        data: customerAddCartReq.toJson(),
      );
      if (response.statusCode == 200) {
        final customerAddCartResponse =
            CustomerAddCartRes.fromJson(response.data);
        if (customerAddCartResponse.newCart != null) {
          return customerAddCartResponse;
        } else {
          final customerAddCartResponse =
              CustomerAddCartRes(error: "No Product Found");
          return customerAddCartResponse;
        }
      } else {
        final customerAddCartResponse =
            CustomerAddCartRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerAddCartResponse;
        } else {
          return CustomerAddCartRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerAddCartRes(error: "Unexpected Error");
    }
  }

  Future<CustomerDisplayCartRes?> displayCart() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerDisplayCart,
      );
      if (response.statusCode == 200) {
        final customerDisplayCartResponse =
            CustomerDisplayCartRes.fromJson(response.data);
        if (customerDisplayCartResponse.cart != null) {
          return customerDisplayCartResponse;
        } else {
          final customerDisplayCartResponse =
              CustomerDisplayCartRes(error: "No Product Found");
          return customerDisplayCartResponse;
        }
      } else {
        final customerDisplayCartResponse =
            CustomerDisplayCartRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerDisplayCartResponse;
        } else {
          return CustomerDisplayCartRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerDisplayCartRes(error: "Unexpected Error");
    }
  }

  Future<CustomerDeleteCartRes?> deleteCart(String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.customerDeleteCart,
        queryParameters: id,
      );
      if (response.statusCode == 200) {
        final customerDeleteCartResponse =
            CustomerDeleteCartRes.fromJson(response.data);
        if (customerDeleteCartResponse.message != null) {
          return customerDeleteCartResponse;
        } else {
          final customerDeleteCartResponse =
              CustomerDeleteCartRes(error: "No Product Found");
          return customerDeleteCartResponse;
        }
      } else {
        final customerDeleteCartResponse =
            CustomerDeleteCartRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return customerDeleteCartResponse;
        } else {
          return CustomerDeleteCartRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return CustomerDeleteCartRes(error: "Unexpected Error");
    }
  }
}
