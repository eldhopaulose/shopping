import 'package:shopping/app/networks/dio_client.dart';

enum EndPoints {
  login,
  register,
  getCustomerDetails,
  customerProduct,
  customerProductbycat,
}

extension EndPointsData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
        path = "customer/users/login";
      case EndPoints.register:
        path = "customer/users/signup";
      case EndPoints.getCustomerDetails:
        path = "customer/users/single";
      case EndPoints.customerProduct:
        path = "customer/products";
      case EndPoints.customerProductbycat:
        path = "customer/products";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case EndPoints.login:
        type = ReqType.POST;
      case EndPoints.register:
        type = ReqType.POST;
      case EndPoints.getCustomerDetails:
        type = ReqType.GET;
      case EndPoints.customerProduct:
        type = ReqType.GET;
      case EndPoints.customerProductbycat:
        type = ReqType.GET;
    }
    return type;
  }

  bool hasToken() {
    bool token = false;
    switch (this) {
      case EndPoints.login:
        token = false;
      case EndPoints.register:
        token = false;
      case EndPoints.getCustomerDetails:
        token = true;
      case EndPoints.customerProduct:
        token = false;
      case EndPoints.customerProductbycat:
        token = false;
    }
    return token;
  }
}
