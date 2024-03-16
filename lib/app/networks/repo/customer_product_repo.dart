import 'package:dio/dio.dart';
import 'package:shopping/app/networks/dio_client.dart';
import 'package:shopping/app/networks/endpoints.dart';
import 'package:shopping/app/networks/network_model/res/customer_like_display.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_like.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_res.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_unlike.dart';

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
}
