import 'package:dio/dio.dart';
import 'package:shopping/app/networks/dio_client.dart';
import 'package:shopping/app/networks/endpoints.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_res.dart';

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
}
